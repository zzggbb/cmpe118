#include "xc.h"
#include "BOARD.h"
#include "ES_Configure.h"
#include "ES_Events.h"
#include "serial.h"

#include "BumpEventChecker.h"
#include "pins.h"
#include "robot.h"

#define NUM_SENSORS 2

#define SaveEvent(x) do {eventName=__func__; storedEvent=x;} while (0)
static const char *eventName;
static ES_Event storedEvent;

static uint8_t state[NUM_SENSORS];
static uint8_t last_state[NUM_SENSORS];
static uint8_t events[NUM_SENSORS] = {
  BUMP_L,
  BUMP_R,
};
static uint8_t pins[NUM_SENSORS] = {
  BUMP_L_PIN,
  BUMP_R_PIN,
};
static uint8_t initialized = FALSE;

uint8_t BumpEventChecker(void) {
  int sensor;

  if (!initialized) {
    for (sensor = 0; sensor < NUM_SENSORS; sensor++) {
      state[sensor] = last_state[sensor] = read_pin(pins[sensor]);
    }
    initialized = TRUE;
  }

  uint8_t was_event = FALSE;
  uint8_t reading;
  for (sensor = 0; sensor < NUM_SENSORS; sensor++) {
    reading = read_pin(pins[sensor]);

    if (reading == PRESSED)
      state[sensor] = PRESSED;

    if (reading == UNPRESSED)
      state[sensor] = UNPRESSED;

    if (state[sensor] != last_state[sensor]) {
      was_event = TRUE;
      ES_Event event = {.EventType = events[sensor], .EventParam = state[sensor]};

      SaveEvent(event);

      last_state[sensor] = state[sensor];
    }
  }
  return was_event;
}

#include <stdio.h>
static uint8_t(*EventList[])(void) = {BumpEventChecker};
void PrintEvent(void) {
    printf("\r\nFunc: %s Event: %s Param: 0x%X", eventName,
            EventNames[storedEvent.EventType], storedEvent.EventParam);
}
void main(void) {
    BOARD_Init();
    robot_init();

    printf(__FILE__ " " __DATE__ " " __TIME__ "\r\n");

    int i;
    for(;;) {
        if (IsTransmitEmpty()) {
            for (i = 0; i< sizeof (EventList) >> 2; i++) {
                if (EventList[i]() == TRUE) {
                    PrintEvent();
                    break;
                }
            }
        }
    }
}
