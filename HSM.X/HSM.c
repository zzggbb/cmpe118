#include <xc.h>
#include <stdio.h>

#include "ES_Configure.h"
#include "ES_Framework.h"

#include "HSM.h"

#include "EdgeAlign.h"
#include "EdgeFollower.h"
#include "TapeEventChecker.h"
#include "Rotate90.h"
#include "FindIFZ.h"
#include "BeaconAlign.h"
#include "Attack.h"

#include "robot.h"
#include "pins.h"

#define FIRST_BACKUP_TIMEOUT 1000

typedef enum {
  init,
  first_align,
  first_backup,
  first_edge_find,
  align_first_edge_left,
  align_first_edge_right,
  rotate_90_cw,
  rotate_90_ccw,
  follow_first_edge_left,
  follow_first_edge_right,
  finding_ifz,
  attacking,
} HSMState;

static const char *StateNames[] = {
  "init",
  "first_align",
  "first_backup",
  "first_edge_find",
  "align_first_edge_left",
  "align_first_edge_right",
  "rotate_90_cw",
  "rotate_90_ccw",
  "follow_first_edge_left",
  "follow_first_edge_right",
  "finding_ifz",
  "attacking",
};

static HSMState CurrentState;
static uint8_t MyPriority;

uint8_t InitHSM(uint8_t priority) {
  //printf("function call: InitHSM\r\n");
  MyPriority = priority;
  CurrentState = init;
  return ES_PostToService(MyPriority, INIT_EVENT);
}

uint8_t PostHSM(ES_Event ThisEvent) {
  return ES_PostToService(MyPriority, ThisEvent);
}

ES_Event RunHSM(ES_Event ThisEvent) {
  HSMState nextState;
  uint8_t makeTransition = FALSE;

  ES_Tattle();

  switch (CurrentState) {
    case init:
      if (ThisEvent.EventType == ES_INIT) {
        //nextState = first_edge_find;
        nextState = follow_first_edge_left;
        makeTransition = TRUE;
      }
      break;

    case first_align:
      ThisEvent = RunBeaconAlign(ThisEvent);

      switch (ThisEvent.EventType) {
        case ES_ENTRY:
          //printf("entry to first_align\r\n");
          robot_stop();
          InitBeaconAlign();
          break;

        case BEACON_ALIGN_DONE:
          //printf("exit from first_align\r\n");
          nextState = first_backup;
          makeTransition = TRUE;
          break;
      }
      break;

    case first_backup:
      switch (ThisEvent.EventType) {
        case ES_ENTRY:
          //printf("entry to first_backup\r\n");
          robot_rev(500);
          ES_Timer_InitTimer(FIRST_BACKUP_TIMER, FIRST_BACKUP_TIMEOUT);
          break;

        case ES_TIMEOUT:
          if (ThisEvent.EventParam == FIRST_BACKUP_TIMER) {
            //printf("timeout in first_backup\r\n");
            robot_stop();
            nextState = first_edge_find;
            makeTransition = TRUE;
          }
          break;

      }
      break;

    case first_edge_find:
      switch (ThisEvent.EventType) {
        case ES_ENTRY:
          //printf("entry to first_edge_find\r\n");
          robot_fwd(500);
          break;

        case TAPE_L:
          if (ThisEvent.EventParam == ON_WHITE) {
            // we're gonna follow the left edge
           // printf("crossed edge on left side first\r\n");
            robot_stop();
            nextState = align_first_edge_left;
            makeTransition = TRUE;
          }
          break;

        case TAPE_R:
          if (ThisEvent.EventParam == ON_WHITE) {
            // we're gonna follow the right edge
            //printf("crossed edge on right side first\r\n");
            robot_stop();
            nextState = align_first_edge_right;
            makeTransition = TRUE;
          }
          break;
      }
      break;

    case align_first_edge_left:
      ThisEvent = RunEdgeAlign(ThisEvent);
      switch (ThisEvent.EventType) {
        case ES_ENTRY:
          InitEdgeAlign(LEFT);
          break;

        case EDGE_ALIGN_DONE:
          nextState = follow_first_edge_left;
          makeTransition = TRUE;
          break;
      }
      break;

    case align_first_edge_right:
      ThisEvent = RunEdgeAlign(ThisEvent);
      switch (ThisEvent.EventType) {
        case ES_ENTRY:
          InitEdgeAlign(RIGHT);
          break;

        case EDGE_ALIGN_DONE:
          nextState = follow_first_edge_right;
          makeTransition = TRUE;
          break;
      }
      break;

    case follow_first_edge_left:
      ThisEvent = RunEdgeFollower(ThisEvent);
      switch (ThisEvent.EventType) {
        case ES_ENTRY:
          InitEdgeFollower(LEFT);
          break;

        case EDGE_FOLLOW_DONE:
          nextState = rotate_90_cw;
          makeTransition = TRUE;
          break;
      }
      break;

    case follow_first_edge_right:
      ThisEvent = RunEdgeFollower(ThisEvent);
      switch (ThisEvent.EventType) {
        case ES_ENTRY:
          InitEdgeFollower(RIGHT);
          break;

        case EDGE_FOLLOW_DONE:
          nextState = rotate_90_ccw;
          makeTransition = TRUE;
          break;
      }
      break;

    case rotate_90_cw:
      ThisEvent = RunRotate90(ThisEvent);
      switch (ThisEvent.EventType) {
        case ES_ENTRY:
          InitRotate90(CW);
          break;

        case ROTATE_90_DONE:
          //nextState = finding_ifz;
          //InitFindIFZ(LEFT);
          //makeTransition = TRUE;
          break;
      }
      break;

    case rotate_90_ccw:
      ThisEvent = RunRotate90(ThisEvent);
      switch (ThisEvent.EventType) {
        case ES_ENTRY:
          InitRotate90(CCW);
          break;

        case ROTATE_90_DONE:
          //nextState = finding_ifz;
          //InitFindIFZ(RIGHT);
          //makeTransition = TRUE;
          break;
      }
      break;

    case finding_ifz:
      switch (ThisEvent.EventType) {
        case FIND_IFZ_LEFT_DONE:
          robot_stop();
          InitAttack(LEFT);
          nextState = attacking;
          makeTransition = TRUE;
          break;

        case FIND_IFZ_RIGHT_DONE:
          robot_stop();
          InitAttack(RIGHT);
          nextState = attacking;
          makeTransition = TRUE;
          break;

        default:
          RunFindIFZ(ThisEvent);
          break;

      }
      break;

    case attacking:
      ThisEvent = RunAttack(ThisEvent);
      switch (ThisEvent.EventType) {
        case ES_ENTRY:
          //printf("entry to attacking\r\n");
          break;

      }
      break;
  }

  if (makeTransition) {
    RunHSM((ES_Event){.EventType = ES_EXIT});
    CurrentState = nextState;
    RunHSM((ES_Event){.EventType = ES_ENTRY});
  }

  ES_Tail();
  return ThisEvent;
}
