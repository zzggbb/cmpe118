#include <xc.h>
#include <stdio.h>

#include "BOARD.h"
#include "ES_Configure.h"
#include "ES_Events.h"
#include "serial.h"

#include "BeaconEventChecker.h"
#include "HSM.h"
#include "pins.h"
#include "robot.h"

#define BEACON_UPPER_THRESHOLD 830
#define BEACON_LOWER_THRESHOLD 600

#define SaveEvent(x) do {eventName=__func__;storedEvent=x;} while (0)
static const char *eventName;
static ES_Event storedEvent;

typedef enum {
  uninitialized,
  waiting_decision,
  waiting_fall,
  waiting_rise,
} BeaconEventCheckerState;

static BeaconEventCheckerState state = uninitialized;

uint8_t BeaconEventChecker(void) {
  if (!AD_IsNewDataReady())
    return FALSE;

  uint16_t reading = AD_ReadADPin(BEACON_ANALOG_PIN);
  uint8_t was_event = FALSE;

  switch (state) {
    case uninitialized:
      printf("upper=%d lower=%d\r\n", BEACON_UPPER_THRESHOLD, BEACON_LOWER_THRESHOLD);
      state = waiting_decision;
      break;

    case waiting_decision:
      if (reading > BEACON_UPPER_THRESHOLD)
        state = waiting_fall;

      if (reading < BEACON_LOWER_THRESHOLD)
        state = waiting_rise;

      break;

    case waiting_fall:
      if (reading < BEACON_LOWER_THRESHOLD) {
        //printf("transitioned below threshold %d\r\n", BEACON_LOWER_THRESHOLD);
        PostHSM((ES_Event){.EventType = BEACON_CHANGE, .EventParam = BEACON_OFF});
        state = waiting_rise;
        was_event = TRUE;
      }
      break;

    case waiting_rise:
      if (reading > BEACON_UPPER_THRESHOLD) {
        //printf("transitioned above threshold %d\r\n", BEACON_UPPER_THRESHOLD);
        PostHSM((ES_Event){.EventType = BEACON_CHANGE, .EventParam = BEACON_ON});
        state = waiting_fall;
        was_event = TRUE;
      }
      break;
  }

  return was_event;
}

#ifdef EVENTCHECKER_TEST
static uint8_t(*EventList[])(void) = {BeaconEventChecker};
void PrintEvent(void){
  //printf("func: %s event: %s param: 0x%X\r\n", eventName,
  //    EventNames[storedEvent.EventType], storedEvent.EventParam);
}
void main(void) {
  BOARD_Init();
  robot_init();

  printf(__FILE__ " " __DATE__ " " __TIME__ "\r\n");

  int i;
  for (;;) {
    if (IsTransmitEmpty()) {
      for (i=0; i<sizeof(EventList) >> 2; i++) {
        if (EventList[i]() == TRUE) {
          PrintEvent();
          break;
        }
      }
    }
  }
}
#endif
