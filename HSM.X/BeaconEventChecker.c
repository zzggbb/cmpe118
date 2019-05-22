#include <xc.h>
#include <stdio.h>

#include "BOARD.h"
#include "ES_Configure.h"
#include "ES_Events.h"
#include "serial.h"

#include "BeaconEventChecker.h"
#include "pins.h"
#include "robot.h"

#define SaveEvent(x) do {eventName=__func__;storedEvent=x;} while (0)
static const char *eventName;
static ES_Event storedEvent;

uint8_t BeaconEventChecker(void) {
  static uint8_t last_beacon_reading = 0xFF;

  if (last_beacon_reading == 0xFF)
    last_beacon_reading = read_pin(BEACON_PIN);

  uint8_t current_beacon_reading = read_pin(BEACON_PIN);

  if (last_beacon_reading != current_beacon_reading) {
    ES_Event event = {
      .EventType = BEACON_CHANGE,
      .EventParam = current_beacon_reading,
    };

    SaveEvent(event);

    last_beacon_reading = current_beacon_reading;
    return TRUE;
  }
  return FALSE;
}

#ifdef EVENTCHECKER_TEST
static uint8_t(*EventList[])(void) = {EVENT_CHECK_LIST};
void PrintEvent(void) {
  printf("func: %s event: %s param: 0x%X\r\n", eventName,
      EventNames[storedEvent.EventType], storedEvent.EventParam);
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
