#include "xc.h"
#include "BOARD.h"
#include "ES_Configure.h"
#include "ES_Events.h"
#include "serial.h"

#include "TapeEventChecker.h"
#include "pins.h"

#define EVENTCHECKER_TEST
#define HISTORY_SIZE 3
#define NUM_SENSORS 2

#ifdef EVENTCHECKER_TEST
#include <stdio.h>
#define SaveEvent(x) do {eventName=__func__;storedEvent=x;} while (0)
static const char *eventName;
static ES_Event storedEvent;
#endif

static uint8_t history[NUM_SENSORS][HISTORY_SIZE];
static uint8_t state[NUM_SENSORS];
static uint8_t last_state[NUM_SENSORS];
static uint8_t events[NUM_SENSORS] = {
  TAPE_L,
  TAPE_R,
};
static uint8_t pins[NUM_SENSORS] = {
  32,
  33,
};

static uint8_t initialized = FALSE;

void append_history(uint8_t *history, uint8_t value) {
  int i;
  for (i = 0; i < HISTORY_SIZE - 1; i++) {
    history[i] = history[i+1];
  }
  history[HISTORY_SIZE - 1] = value;
}

uint8_t all_equal(uint8_t *data, uint8_t size, uint8_t value) {
  int i;
  for (i = 0; i < size; i++)
    if (data[i] != value)
      return FALSE;

  return TRUE;
}

uint8_t TapeEventChecker(void) {
  int sensor;

  if (!initialized) {
    int i;
    for (sensor = 0; sensor < NUM_SENSORS; sensor++) {
      for (i=0; i<HISTORY_SIZE; i++)
        history[sensor][i] = 0xFF;

      state[sensor] = read_pin(pins[sensor]);
      last_state[sensor] = read_pin(pins[sensor]);
    }
    initialized = TRUE;
  }

  uint8_t was_event = FALSE;

  uint8_t reading;
  for (sensor = 0; sensor < NUM_SENSORS; sensor++) {
    reading = read_pin(pins[sensor]);
    append_history(history[sensor], reading);

    if (all_equal(history[sensor], HISTORY_SIZE, ON_BLACK))
      state[sensor] = ON_BLACK;

    if (all_equal(history[sensor], HISTORY_SIZE, ON_WHITE))
      state[sensor] = ON_WHITE;

    if (state[sensor] != last_state[sensor]) {
      was_event = TRUE;
      ES_Event event = {.EventType = events[sensor], .EventParam = state[sensor]};
#ifdef EVENTCHECKER_TEST
      SaveEvent(event);
#else
      PostGenericService(event);
#endif
      last_state[sensor] = state[sensor];
    }
  }
  return was_event;
}

#ifdef EVENTCHECKER_TEST
#include <stdio.h>
static uint8_t(*EventList[])(void) = {EVENT_CHECK_LIST};
void PrintEvent(void){
  printf("func: %s event: %s param: 0x%X\r\n", eventName,
      EventNames[storedEvent.EventType], storedEvent.EventParam);
}
void main(void) {
  BOARD_Init();
  int sensor;
  for (sensor = 0; sensor < NUM_SENSORS; sensor++)
    set_tris(pins[sensor], 1);

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
