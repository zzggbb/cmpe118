#include <xc.h>
#include <stdio.h>

#include "ES_Configure.h"
#include "ES_Framework.h"

#include "ShootN.h"
#include "HSM.h"

#include "robot.h"
#include "pins.h"

#define FIRING_TIMEOUT 1500 // milliseconds

typedef enum {
  uninitialized,
  shooting,
  loading,
  done,
} ShootNState;

static const char *StateNames[] = {
  "uninitialized",
  "shooting",
  "loading",
  "done",
};

static ShootNState CurrentState = uninitialized;
static uint8_t shots_fired;
static uint8_t clip_size;

uint8_t InitShootN(uint8_t _clip_size) {
  printf("function call: InitShootN: clip size=%d\r\n", _clip_size);
  CurrentState = shooting;
  clip_size = _clip_size;
  shots_fired = 0;
  return TRUE;
}

ES_Event RunShootN(ES_Event ThisEvent) {
  ShootNState nextState;
  uint8_t makeTransition = FALSE;

  ES_Tattle();

  switch (CurrentState) {
    case shooting:
      switch (ThisEvent.EventType) {
        case ES_ENTRY:
          if (shots_fired == clip_size) {
            nextState = done;
            makeTransition = TRUE;
          } else {
            ES_Timer_InitTimer(FIRING_TIMER, FIRING_TIMEOUT);
            robot_gun_shoot();
            shots_fired++;
          }
          break;

        case ES_TIMEOUT:
          if (ThisEvent.EventParam == FIRING_TIMER) {
            nextState = loading;
            makeTransition = TRUE;
          }
          break;

      }
      break;

    case loading:
      switch (ThisEvent.EventType) {
        case ES_ENTRY:
          robot_gun_load();
          ES_Timer_InitTimer(FIRING_TIMER, FIRING_TIMEOUT);
          break;

        case ES_TIMEOUT:
          if (ThisEvent.EventParam == FIRING_TIMER) {
            nextState = shooting;
            makeTransition = TRUE;
          }
          break;
      }
      break;

    case done:
      if (ThisEvent.EventType == ES_ENTRY) {
        robot_gun_load();
        PostHSM((ES_Event){.EventType = SHOOTN_DONE});
        CurrentState = uninitialized;
      }
      break;

  }

  if (makeTransition) {
    RunShootN((ES_Event){.EventType = ES_EXIT});
    CurrentState = nextState;
    RunShootN((ES_Event){.EventType = ES_ENTRY});
  }

  ES_Tail();
  return ThisEvent;
}
