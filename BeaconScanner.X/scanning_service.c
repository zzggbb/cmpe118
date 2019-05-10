#include "xc.h"
#include "ES_Configure.h"
#include "ES_Framework.h"

#include "scanning_service.h"
#include "robot.h"


typedef enum {
  init,
  done,
  going_right,
  going_up_on_right,
  going_left,
  going_up_on_left,
} scanning_service_state;

static const char *StateNames[] = {
  "init",
  "done",
  "going_right",
  "going_up_on_right",
  "going_left",
  "going_up_on_left",
}

static scanning_service_state CurrentState;
static uint8_t MyPriority;

uint8_t init_scanning_service(uint8_t priority) {
  MyPriority = priority;
  CurrentState = init;
  ES_Timers_Init();
  return (ES_PostToService(MyPriority, INIT_EVENT));
}

uint8_t post_scanning_service(ES_Event ThisEvent) {
  return ES_PostToService(MyPriority, ThisEvent);
}

ES_Event run_scanning_service(ES_Event ThisEvent) {
  scanning_service_state nextState;
  uint8_t makeTransition = FALSE;

  ES_Tattle();

  // no matter what state we're in, we're done when we find the beacon
  if (ThisEvent.EventType == BEACON_ON) {
    nextState = done;
    makeTransition = TRUE;
  } else {
    switch (CurrentState) {
      case init:
        if (ThisEvent.EventType == ES_Init) {
          nextState = going_right;
          makeTransition = TRUE;
        }
        break;

      case going_right:
        switch (ThisEvent.EventType) {
          case ES_ENTRY:
            ES_Timers_InitTimer(GUN_ROTATE_TIMER, GUN_ROTATE_TIMER_TIME);
            robot_cw();
            break;

          case ES_TIMEOUT:
            if (ThisEvent.EventParam == GUN_ROTATE_TIMER) {
              nextState = going_up_on_right;
              makeTransition = TRUE;
            }
            break;

          case ES_EXIT:
            robot_stop();
            break;
        }
        break;

      case going_up_on_right:
        switch (ThisEvent.EventType) {
          case ES_ENTRY:
            ES_Timers_InitTimer(GUN_PITCH_TIMER, GUN_PITCH_TIMER_TIME);
            // 0.5 degrees is 1.67 inches from 16 feet away
            robot_gun_pitch_up(0.5);
            break;

          case ES_TIMEOUT:
            if (ThisEvent.EventParam == GUN_PITCH_TIMER) {
              nextState = going_left;
              makeTransition = TRUE;
            }
            break;

          case ES_EXIT:
            robot_stop();
            break;

        }
        break;

      case going_left:
        switch (ThisEvent.EventType) {
          case ES_ENTRY:
            ES_Timers_InitTimer(GUN_ROTATE_TIMER, GUN_ROTATE_TIMER_TIME);
            robot_ccw();
            break;

          case ES_TIMEOUT:
            if (ThisEvent.EventParam == GUN_ROTATE_TIMER) {
              nextState = going_up_on_left;
              makeTransition = TRUE;
            }

          case ES_EXIT:
            robot_stop();
            break;
        }
        break;

      case going_up_on_left:
        switch (ThisEvent.EventType) {
          case ES_ENTRY:
            ES_Timers_InitTimer(GUN_PITCH_TIMER, GUN_PITCH_TIMER_TIME);
            // 0.5 degrees is 1.67 inches from 16 feet away
            robot_gun_pitch_up(0.5);
            break;

          case ES_TIMEOUT:
            if (ThisEvent.EventParam == GUN_PITCH_TIMER) {
              nextState = going_right;
              makeTransition = TRUE;
            }

          case ES_EXIT:
            robot_stop();
            break;
        }
        break;

      default:
        break;
    }
  }

  if (makeTransition) {
    run_scanning_service((ES_Event){.EventType = ES_EXIT});
    CurrentState = nextState;
    run_scanning_service((ES_Event){.EventType = ES_ENTRY});
  }

  ES_Tail();
  return ThisEvent;
}
