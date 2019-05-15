#include "xc.h"
#include "ES_Configure.h"
#include "ES_Framework.h"

#include "TapeEventChecker.h"
#include "EdgeFollower.h"
#include "robot.h"
#include "pins.h"

typedef enum {
  init,
  aligning,
  curving_left,
  curving_right,
  done,
} EdgeFollowerState;

static const char *StateNames[] = {
  "init",
  "aligning",
  "curving_left",
  "curving_right",
  "done",
};

static EdgeFollowerState CurrentState;
static uint8_t MyPriority;

uint8_t InitEdgeFollower(uint8_t priority) {
  MyPriority = priority;
  CurrentState = init;
  return ES_PostToService(MyPriority, INIT_EVENT);
}

uint8_t PostEdgeFollower(ES_Event ThisEvent) {
  return ES_PostToService(MyPriority, ThisEvent);
}

ES_Event RunEdgeFollower(ES_Event ThisEvent) {
  EdgeFollowerState nextState;
  uint8_t makeTransition = FALSE;

  ES_Tattle();

  switch (CurrentState) {
    case init:
      if (ThisEvent.EventType == ES_INIT) {
        nextState = aligning;
        makeTransition = TRUE;
      }
      break;

    case aligning:
      switch (ThisEvent.EventType) {
        case ES_ENTRY:
          robot_cw();
          break;

        case TAPE_L:
          if (ThisEvent.EventParam == ON_WHITE) {
            nextState = curving_left;
            makeTransition = TRUE;
          }
          break;

      }
      break;

    case curving_left:
      switch (ThisEvent.EventType) {
        case ES_ENTRY:
          robot_curve_l();
          break;

        case TAPE_L:
          if (ThisEvent.EventParam == ON_BLACK) {
            nextState = curving_right;
            makeTransition = TRUE;
          }
          break;

        case TAPE_R:
          if (ThisEvent.EventParam == ON_BLACK) {
            nextState = done;
            makeTransition = TRUE;
          }
      }
      break;

    case curving_right:
      switch (ThisEvent.EventType) {
        case ES_ENTRY:
          robot_curve_r();
          break;

        case TAPE_L:
          if (ThisEvent.EventParam == ON_WHITE) {
            nextState = curving_left;
            makeTransition = TRUE;
          }
          break;

        case TAPE_R:
          if (ThisEvent.EventParam == ON_BLACK) {
            nextState = done;
            makeTransition = TRUE;
          }
      }
      break;

    case done:
      if (ThisEvent.EventType == ES_ENTRY) {
        robot_stop();
      }
      break;
  }

  if (makeTransition) {
    RunEdgeFollower((ES_Event){.EventType = ES_EXIT});
    CurrentState = nextState;
    RunEdgeFollower((ES_Event){.EventType = ES_ENTRY});
  }

  ES_Tail();
  return ThisEvent;
}

