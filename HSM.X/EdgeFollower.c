#include <xc.h>
#include <stdio.h>

#include "ES_Configure.h"
#include "ES_Framework.h"
#include "serial.h"

#include "TapeEventChecker.h"
#include "EdgeFollower.h"
#include "HSM.h"

#include "robot.h"
#include "pins.h"

typedef enum {
  uninitialized,
  curving_left,
  curving_right,
  done,
} EdgeFollowerState;

static const char *StateNames[] = {
  "uninitialized",
  "curving_left",
  "curving_right",
  "done",
};

static EdgeFollowerState CurrentState = uninitialized;
static uint8_t mode;

uint8_t InitEdgeFollower(uint8_t _mode) {
  //printf("in InitEdgeFollower\r\n");
  mode = _mode;

  uint8_t reading;

  if (mode == LEFT) {
    reading = read_pin(TAPE_L_PIN);
    if (reading == ON_BLACK) {
      CurrentState = curving_left;
      printf("EdgeFollower: initialized to curving left because left was on black\r\n");
    } else {
      CurrentState = curving_right;
      printf("EdgeFollower: initialized to curving right because left was on white\r\n");
    }
  } else {
    reading = read_pin(TAPE_R_PIN);
    if (reading == ON_BLACK) {
      CurrentState = curving_right;
      printf("EdgeFollower: initialized to curving right because right was on black\r\n");
    } else {
      CurrentState = curving_left;
      printf("EdgeFollower: initialized to curving left because right was on white\r\n");
    }
  }

  RunEdgeFollower((ES_Event){.EventType = ES_ENTRY});
  return TRUE;
}

ES_Event RunEdgeFollower(ES_Event ThisEvent) {
  EdgeFollowerState nextState;
  uint8_t makeTransition = FALSE;

  ES_Tattle();

  switch (CurrentState) {

    case curving_left:
      switch (ThisEvent.EventType) {
        case ES_ENTRY:
          printf("EdgeFollower: entered curving_left\r\n");
          robot_curve_l(400);
          break;

        case TAPE_L:
          printf("EdgeFollower/curving_left: TAPE_L\r\n");
          if (ThisEvent.EventParam == ON_WHITE) {
            nextState = (mode == LEFT) ? curving_right : done;
            makeTransition = TRUE;
          }
          break;

        case TAPE_R:
          printf("EdgeFollower/curving_left: TAPE_R\r\n");
          if (mode == LEFT && ThisEvent.EventParam == ON_WHITE) {
            nextState = done;
            makeTransition = TRUE;
          }

          if (mode == RIGHT && ThisEvent.EventParam == ON_BLACK) {
            nextState = curving_right;
            makeTransition = TRUE;
          }
          break;
      }
      break;

    case curving_right:
      switch (ThisEvent.EventType) {
        case ES_ENTRY:
          printf("EdgeFollower: entered curving_right\r\n");
          robot_curve_r(400);
          break;

        case TAPE_L:
          printf("EdgeFollower/curving_right: TAPE_L\r\n");
          if (mode == LEFT && ThisEvent.EventParam == ON_BLACK) {
            nextState = curving_left;
            makeTransition = TRUE;
          }

          if (mode == RIGHT && ThisEvent.EventParam == ON_WHITE) {
            nextState = done;
            makeTransition = TRUE;
          }
          break;

        case TAPE_R:
          printf("EdgeFollower/curving_right: TAPE_R\r\n");
          if (ThisEvent.EventParam == ON_WHITE) {
            nextState = (mode == LEFT) ? done : curving_left;
            makeTransition = TRUE;
          }
          break;
      }
      break;

    case done:
      if (ThisEvent.EventType == ES_ENTRY) {
        printf("EdgeFollower: done\r\n");
        robot_stop();
        PostHSM((ES_Event){.EventType = EDGE_FOLLOW_DONE});
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

