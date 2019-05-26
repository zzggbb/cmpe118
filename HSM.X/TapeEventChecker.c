#include <xc.h>
#include <stdio.h>

#include "BOARD.h"
#include "ES_Configure.h"
#include "ES_Events.h"
#include "serial.h"

#include "TapeEventChecker.h"
#include "HSM.h"
#include "pins.h"
#include "robot.h"

#define HISTORY_SIZE 3
#define NUM_SENSORS 2

#define SaveEvent(x) do {eventName=__func__;storedEvent=x;} while (0)
static const char *eventName;
static ES_Event storedEvent;

static uint8_t history[NUM_SENSORS][HISTORY_SIZE];
static uint8_t state[NUM_SENSORS];
static uint8_t last_state[NUM_SENSORS];
static uint8_t events[NUM_SENSORS] = {
  TAPE_L,
  TAPE_R,
};
static uint8_t pins[NUM_SENSORS] = {
  TAPE_L_PIN,
  TAPE_R_PIN,
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
    printf("initializing tape event checker...\r\n");
    int i;
    for (sensor = 0; sensor < NUM_SENSORS; sensor++) {
      for (i=0; i<HISTORY_SIZE; i++)
        history[sensor][i] = 0xFF;

      state[sensor] = last_state[sensor] = read_pin(pins[sensor]);
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

      PostHSM(event);

      last_state[sensor] = state[sensor];
    }
  }
  return was_event;
}

#ifdef EVENTCHECKER_TEST
static uint8_t(*EventList[])(void) = {TapeEventChecker};
void PrintEvent(void){
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
