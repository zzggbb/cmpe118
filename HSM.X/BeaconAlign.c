#include <xc.h>
#include <stdio.h>

#include "ES_Configure.h"
#include "ES_Framework.h"

#include "BeaconEventChecker.h"
#include "BeaconAlign.h"
#include "HSM.h"

#include "robot.h"
#include "pins.h"

#define ROTATE_SPEED 400 // 40% duty cycle

/* If we detect a beacon for a time less than this, we will just stop when we
 * stop detecting it. units are in milliseconds */
#define TIME_THRESHOLD 75

#define ALIGN_NUDGE_TIMEOUT 50 // milliseconds

#define ALIGN_STOP_TIMEOUT 500 // milliseconds

typedef enum {
  uninitialized,
  finding_start,
  finding_end,
  finding_start_again,
  finding_middle,
  stopped,
  nudging,
  done,
} BeaconAlignState;

static const char *StateNames[] = {
  "uninitialized",
  "finding_start",
  "finding_end",
  "finding_start_again",
  "finding_middle",
  "stopped",
  "nudging",
  "done",
};

static BeaconAlignState CurrentState = uninitialized;

uint8_t InitBeaconAlign(void) {
  //printf("function called: InitBeaconAlign\r\n");
  CurrentState = finding_start;
  robot_cw(ROTATE_SPEED);
  return TRUE;
}

ES_Event RunBeaconAlign(ES_Event ThisEvent) {
  BeaconAlignState nextState;
  uint8_t makeTransition = FALSE;

  static uint32_t start_time;
  static uint32_t end_time;

  ES_Tattle();

  switch (CurrentState) {
    case finding_start:
      switch (ThisEvent.EventType) {
        case BEACON_CHANGE:
          if (ThisEvent.EventParam == BEACON_ON) {
            //printf("beacon turned on in finding_start\r\n");
            // we found the start
            nextState = finding_end;
            ThisEvent.EventType = ES_NO_EVENT;
            makeTransition = TRUE;
            start_time = ES_Timer_GetTime();
          }
          break;

      }
      break;

    case finding_end:
      if (EventMatch(ThisEvent, BEACON_CHANGE, BEACON_OFF)) {
        //printf("beacon turned off in finding_end\r\n");
        end_time = ES_Timer_GetTime();
        uint32_t diff = end_time - start_time;

        ThisEvent.EventType = ES_NO_EVENT;
        makeTransition = TRUE;

        if ((end_time - start_time) < TIME_THRESHOLD) {
         // printf("beacon was a short blip: %d [ms]\r\n", end_time - start_time);
          // we are far away from the beacon, so the FOV is small,
          // so we just get a blip on our detector.
          nextState = stopped;
        } else {
          //printf("beacon was a long pulse: %d [ms]\r\n", end_time - start_time);
          // we are close to the beacon, so the FOV is large.
          // we will sample the width and then stop halfway
          nextState = finding_start_again;
        }
      }
      break;

    case finding_start_again:
      if (EventMatch(ThisEvent, BEACON_CHANGE, BEACON_ON)) {
        //printf("beacon turned on in finding_start_again\r\n");
        nextState = finding_middle;
        ThisEvent.EventType = ES_NO_EVENT;
        makeTransition = TRUE;
      }
      break;

    case finding_middle:
      switch (ThisEvent.EventType) {
        case ES_ENTRY:
         // printf("entry to finding_middle\r\n");
          ES_Timer_InitTimer(ALIGN_MIDDLE_TIMER, 0.5*(end_time - start_time));
          break;

        case ES_TIMEOUT:
          if (ThisEvent.EventParam == ALIGN_MIDDLE_TIMER) {
          //  printf("timeout from finding_middle\r\n");
            // we have arrived at the middle
            nextState = stopped;
            ThisEvent.EventType = ES_NO_EVENT;
            makeTransition = TRUE;
          }
          break;
      }
      break;

    case stopped:
      switch (ThisEvent.EventType) {
        case ES_ENTRY:
          //printf("entry to stopped\r\n");
          ES_Timer_InitTimer(ALIGN_STOP_TIMER, ALIGN_STOP_TIMEOUT);
          robot_stop();
          break;

        case ES_TIMEOUT:
          //printf("timeout from stopped\r\n");
          if (ThisEvent.EventParam == ALIGN_STOP_TIMER) {
            nextState = nudging;
            ThisEvent.EventType = ES_NO_EVENT;
            makeTransition = TRUE;
          }
          break;
      }
      break;

    case nudging:
      switch (ThisEvent.EventType) {
        case ES_ENTRY:
          //printf("entry to nudging\r\n");
          ES_Timer_InitTimer(ALIGN_NUDGE_TIMER, ALIGN_NUDGE_TIMEOUT);
          robot_ccw(500);
          break;

        case ES_TIMEOUT:
          //printf("timeout from nudging\r\n");
          if (ThisEvent.EventParam == ALIGN_NUDGE_TIMER) {
            robot_stop();
            nextState = done;
            ThisEvent.EventType = ES_NO_EVENT;
            makeTransition = TRUE;
          }
          break;
      }
      break;

    case done:
      switch (ThisEvent.EventType) {
        case ES_ENTRY:
          //printf("entry to BeaconAlign/done\r\n");
          PostHSM((ES_Event){.EventType = BEACON_ALIGN_DONE});
          CurrentState = uninitialized;
      }
      break;

  }

  if (makeTransition) {
    RunBeaconAlign((ES_Event){.EventType = ES_EXIT});
    CurrentState = nextState;
    RunBeaconAlign((ES_Event){.EventType = ES_ENTRY});
  }

  ES_Tail();
  return ThisEvent;
}
