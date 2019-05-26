#include <xc.h>
#include <stdio.h>

#include "ES_Configure.h"
#include "ES_Framework.h"

#include "Rotate90.h"

#include "HSM.h"

#include "robot.h"
#include "pins.h"

#define NINETY_TIMEOUT 1250 // milliseconds TODO: calibrate

typedef enum {
  uninitialized,
  rotating_cw,
  rotating_ccw,
  done,
} Rotate90State;

static const char *StateNames[] = {
  "uninitialized",
  "rotating_cw",
  "rotating_ccw",
  "done",
};

static Rotate90State CurrentState = uninitialized;

uint8_t InitRotate90(uint8_t dir) {
  printf("function call: InitRotate90\r\n");
  CurrentState = (dir == CW) ? rotating_cw : rotating_ccw;
  RunRotate90((ES_Event){.EventType = ES_ENTRY});
  return TRUE;
}

ES_Event RunRotate90(ES_Event ThisEvent) {
  Rotate90State nextState;
  uint8_t makeTransition = FALSE;

  ES_Tattle();

  switch (CurrentState) {

    case rotating_cw:
      switch (ThisEvent.EventType) {
        case ES_ENTRY:
          printf("entry to Rotate90/rotating\r\n");
          robot_cw(500);
          ES_Timer_InitTimer(NINETY_TIMER, NINETY_TIMEOUT);
          break;

        case ES_TIMEOUT:
          if (ThisEvent.EventParam == NINETY_TIMER) {
            robot_stop();
            printf("timeout in Rotate90/rotating\r\n");
            nextState = done;
            makeTransition = TRUE;
          }
          break;

        case ES_EXIT:
          printf("exit from rotating\r\n");
          break;
      }
      break;

    case rotating_ccw:
      switch (ThisEvent.EventType) {
        case ES_ENTRY:
          printf("entry to Rotate90/rotating\r\n");
          robot_ccw(500);
          ES_Timer_InitTimer(NINETY_TIMER, NINETY_TIMEOUT);
          break;

        case ES_TIMEOUT:
          if (ThisEvent.EventParam == NINETY_TIMER) {
            robot_stop();
            printf("timeout in Rotate90/rotating\r\n");
            nextState = done;
            makeTransition = TRUE;
          }
          break;

        case ES_EXIT:
          printf("exit from rotating\r\n");
          break;
      }
      break;

    case done:
      switch (ThisEvent.EventType) {
        case ES_ENTRY:
          printf("entry to Rotate90/done\r\n");
          PostHSM((ES_Event){.EventType = ROTATE_90_DONE});
          break;
      }
      break;

  }

  if (makeTransition) {
    RunRotate90((ES_Event){.EventType = ES_EXIT});
    CurrentState = nextState;
    RunRotate90((ES_Event){.EventType = ES_ENTRY});
  }

  ES_Tail();
  return ThisEvent;
}
