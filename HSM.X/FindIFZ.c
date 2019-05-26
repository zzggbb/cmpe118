#include <xc.h>
#include <stdio.h>

#include "ES_Configure.h"
#include "ES_Framework.h"

#include "TapeEventChecker.h"
#include "EdgeAlign.h"
#include "EdgeFollower.h"
#include "Rotate90.h"
#include "HSM.h"

#include "FindIFZ.h"

#include "robot.h"
#include "pins.h"

#define IFZ_BACKUP_TIMEOUT 250
#define CROSS_TIMEOUT 4000

typedef enum {
  uninitialized,
  following_left,
  following_right,
  backing_up_left,
  backing_up_right,
  rotate_cw,
  rotate_ccw,
  crossing_to_right,
  crossing_to_left,
  waiting_for_edge_left,
  waiting_for_edge_right,
  aligning_left,
  aligning_right,
  done,
} FindIFZState;

static const char *StateNames[] = {
  "uninitialized",
  "following_left",
  "following_right",
  "backing_up_left",
  "backing_up_right",
  "rotate_cw",
  "rotate_ccw",
  "crossing_to_right",
  "crossing_to_left",
  "waiting_for_edge_left",
  "waiting_for_edge_right",
  "aligning_left",
  "aligning_right",
  "done",
};

static FindIFZState CurrentState = uninitialized;

uint8_t InitFindIFZ(uint8_t dir) {
  printf("function call: InitFindIFZ\r\n");
  CurrentState = (dir == LEFT) ? following_left : following_right;
  InitEdgeFollower(dir);
  RunFindIFZ((ES_Event){.EventType = ES_ENTRY});
  return TRUE;
}

ES_Event RunFindIFZ(ES_Event ThisEvent) {
  FindIFZState nextState;
  uint8_t makeTransition = FALSE;

  ES_Tattle();

  switch (CurrentState) {

    case following_left:
      ThisEvent = RunEdgeFollower(ThisEvent);
      switch (ThisEvent.EventType) {
        case BUMP_L:
        case BUMP_R:
          robot_stop();
          nextState = backing_up_left;
          makeTransition = TRUE;
          break;

        case EDGE_FOLLOW_DONE:
          nextState = done;
          makeTransition = TRUE;
          break;

        case ES_EXIT:
          printf("exit from FindIFZ/following_left\r\n");
          break;
      }
      break;

    case following_right:
      ThisEvent = RunEdgeFollower(ThisEvent);
      switch (ThisEvent.EventType) {
        case BUMP_L:
        case BUMP_R:
          robot_stop();
          nextState = backing_up_right;
          makeTransition = TRUE;
          break;

        case EDGE_FOLLOW_DONE:
          nextState = done;
          makeTransition = TRUE;
          break;

        case ES_EXIT:
          printf("exit from FindIFZ/following_right\r\n");
          break;
      }
      break;

    case backing_up_left:
      switch (ThisEvent.EventType) {
        case ES_ENTRY:
          printf("entry to FindIFZ/backing_up_left\r\n");
          ES_Timer_InitTimer(IFZ_BACKUP_TIMER, IFZ_BACKUP_TIMEOUT);
          robot_rev(500);
          break;

        case ES_TIMEOUT:
          if (ThisEvent.EventParam == IFZ_BACKUP_TIMER) {
            robot_stop();
            printf("timeout from FindIFZ/backing_up_left\r\n");
            nextState = rotate_cw;
            makeTransition = TRUE;
          }
          break;
      }
      break;

    case backing_up_right:
      switch (ThisEvent.EventType) {
        case ES_ENTRY:
          printf("entry to FindIFZ/backing_up_right\r\n");
          ES_Timer_InitTimer(IFZ_BACKUP_TIMER, IFZ_BACKUP_TIMEOUT);
          robot_rev(500);
          break;

        case ES_TIMEOUT:
          if (ThisEvent.EventParam == IFZ_BACKUP_TIMER) {
            robot_stop();
            printf("timeout from FindIFZ/backing_up_right\r\n");
            nextState = rotate_ccw;
            makeTransition = TRUE;
          }
          break;
      }
      break;

    case rotate_cw:
      ThisEvent = RunRotate90(ThisEvent);
      switch (ThisEvent.EventType) {
        case ES_ENTRY:
          InitRotate90(CW);
          printf("entry to FindIFZ/rotate_cw\r\n");
          break;

        case ROTATE_90_DONE:
          nextState = crossing_to_left;
          makeTransition = TRUE;
          break;

        case ES_EXIT:
          printf("exit from FindIFZ/rotate_cw\r\n");
          break;
      }
      break;

    case rotate_ccw:
      ThisEvent = RunRotate90(ThisEvent);
      switch (ThisEvent.EventType) {
        case ES_ENTRY:
          InitRotate90(CCW);
          printf("entry to FindIFZ/rotate_ccw\r\n");
          break;

        case ROTATE_90_DONE:
          nextState = crossing_to_right;
          makeTransition = TRUE;
          break;

        case ES_EXIT:
          printf("exit from FindIFZ/rotate_ccw\r\n");
          break;
      }
      break;

    case crossing_to_right:
      switch (ThisEvent.EventType) {
        case ES_ENTRY:
          robot_fwd(500);
          ES_Timer_InitTimer(CROSS_TIMER, CROSS_TIMEOUT);
          printf("entry to FindIFZ/crossing_right\r\n");
          break;

        case ES_TIMEOUT:
          if (ThisEvent.EventParam == CROSS_TIMER) {
            printf("timeout from FindIFZ/crossing_right\r\n");
            nextState = waiting_for_edge_right;
            makeTransition = TRUE;
          }
          break;

        case ES_EXIT:
          printf("exit from FindIFZ/crossing_right\r\n");
          break;
      }
      break;

    case crossing_to_left:
      switch (ThisEvent.EventType) {
        case ES_ENTRY:
          robot_fwd(500);
          ES_Timer_InitTimer(CROSS_TIMER, CROSS_TIMEOUT);
          printf("entry to FindIFZ/crossing_left\r\n");
          break;

        case ES_TIMEOUT:
          if (ThisEvent.EventParam == CROSS_TIMER) {
            printf("timeout in crossing_left\r\n");
            nextState = waiting_for_edge_left;
            makeTransition = TRUE;
          }
          break;

        case ES_EXIT:
          printf("exit from FindIFZ/crossing_left\r\n");
          break;
      }
      break;

    case waiting_for_edge_left:
      switch (ThisEvent.EventType) {
        case TAPE_L:
        case TAPE_R:
          if (ThisEvent.EventParam == ON_WHITE) {
            robot_stop();
            nextState = aligning_left;
            makeTransition = TRUE;
          }
          break;

        case ES_ENTRY:
          printf("entry to FindIFZ/waiting_for_edge_left\r\n");
          break;

        case ES_EXIT:
          printf("exit from FindIFZ/waiting_for_edge_left\r\n");
          break;
      }
      break;

    case waiting_for_edge_right:
      switch (ThisEvent.EventType) {
        case TAPE_L:
        case TAPE_R:
          if (ThisEvent.EventParam == ON_WHITE) {
            robot_stop();
            nextState = aligning_right;
            makeTransition = TRUE;
          }
          break;

        case ES_ENTRY:
          printf("entry to FindIFZ/waiting_for_edge_right\r\n");
          break;

        case ES_EXIT:
          printf("exit from FindIFZ/waiting_for_edge_right\r\n");
          break;
      }
      break;

    case aligning_left:
      ThisEvent = RunEdgeAlign(ThisEvent);
      switch (ThisEvent.EventType) {
        case ES_ENTRY:
          InitEdgeAlign(LEFT);
          printf("entry to FindIFZ/aligning_left\r\n");
          break;

        case EDGE_ALIGN_DONE:
          nextState = following_left;
          makeTransition = TRUE;
          break;

        case ES_EXIT:
          printf("exit from FindIFZ/aligning_left\r\n");
          break;
      }
      break;

    case aligning_right:
      ThisEvent = RunEdgeAlign(ThisEvent);
      switch (ThisEvent.EventType) {
        case ES_ENTRY:
          InitEdgeAlign(RIGHT);
          printf("entry to FindIFZ/aligning_right\r\n");
          break;

        case EDGE_ALIGN_DONE:
          nextState = following_right;
          makeTransition = TRUE;
          break;

        case ES_EXIT:
          printf("exit from FindIFZ/aligning_right\r\n");
          break;
      }
      break;

    case done:
      switch (ThisEvent.EventType) {
        case ES_ENTRY:
          printf("entry to FindIFZ/done\r\n");
          PostHSM((ES_Event){.EventType = FIND_IFZ_DONE});
          break;
      }
      break;

  }

  if (makeTransition) {
    RunFindIFZ((ES_Event){.EventType = ES_EXIT});
    CurrentState = nextState;
    RunFindIFZ((ES_Event){.EventType = ES_ENTRY});
  }

  ES_Tail();
  return ThisEvent;
}
