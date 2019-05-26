#include <xc.h>
#include <stdio.h>

#include "ES_Configure.h"
#include "ES_Framework.h"

#include "TapeEventChecker.h"
#include "EdgeAlign.h"
#include "HSM.h"

#include "robot.h"
#include "pins.h"

typedef enum {
  uninitialized,
  aligning_left,
  aligning_right,
  done,
} EdgeAlignState;

static const char *StateNames[] = {
  "uninitialized",
  "aligning_left",
  "aligning_right",
  "done",
};

static EdgeAlignState CurrentState = uninitialized;

uint8_t InitEdgeAlign(uint8_t dir) {
  // 0 for left, 1 for right
  printf("function call: InitEdgeAlign\r\n");

  CurrentState = (dir == LEFT) ? aligning_left : aligning_right;

  RunEdgeAlign((ES_Event){.EventType = ES_ENTRY});

  return TRUE;
}

ES_Event RunEdgeAlign(ES_Event ThisEvent) {
  EdgeAlignState nextState;
  uint8_t makeTransition = FALSE;

  ES_Tattle();

  switch (CurrentState) {
    case aligning_left:
      switch (ThisEvent.EventType) {
        case ES_ENTRY:
          printf("entry to aligning_left\r\n");
          robot_cw(500);
          break;

        case TAPE_L:
          if (ThisEvent.EventParam == ON_BLACK) {
            printf("finished aligning_left\r\n");
            nextState = done;
            ThisEvent.EventType = ES_NO_EVENT;
            makeTransition = TRUE;
          }
          break;
      }
      break;

    case aligning_right:
      switch (ThisEvent.EventType) {
        case ES_ENTRY:
          printf("entry to aligning_right\r\n");
          robot_ccw(500);
          break;

        case TAPE_R:
          if (ThisEvent.EventParam == ON_BLACK) {
            printf("finished aligning_right\r\n");
            nextState = done;
            ThisEvent.EventType = ES_NO_EVENT;
            makeTransition = TRUE;
          }
      }
      break;

    case done:
      if (ThisEvent.EventType == ES_ENTRY) {
        robot_stop();
        PostHSM((ES_Event){.EventType = EDGE_ALIGN_DONE});
      }
      break;
  }

  if (makeTransition) {
    RunEdgeAlign((ES_Event){.EventType = ES_EXIT});
    CurrentState = nextState;
    RunEdgeAlign((ES_Event){.EventType = ES_ENTRY});
  }

  ES_Tail();
  return ThisEvent;
}
