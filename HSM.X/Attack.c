#include <xc.h>
#include <stdio.h>

#include "ES_Configure.h"
#include "ES_Framework.h"

#include "Attack.h"
#include "BeaconAlign.h"
#include "TapeEventChecker.h"
#include "EdgeFollower.h"
#include "ShootN.h"

#include "robot.h"
#include "pins.h"

#define WARMUP_TIMEOUT 10000 // time for warming up launch motors [milliseconds]
#define FIELD_WIDTH 2750 // time needed to cross the field [milliseconds]

static uint8_t current_position = 0;
static uint8_t num_positions = 5;
static uint8_t shots_per_position[] = {0,1,11,1,0};

typedef enum {
  uninitialized,
  warming_up,
  beacon_aligning,
  shooting,
  edge_aligning,
  finding_next_position,
  done,
} AttackState;

static const char *StateNames[] = {
  "uninitialized",
  "warming_up",
  "beacon_aligning",
  "shooting",
  "edge_aligning",
  "finding_next_position",
  "done",
};

static AttackState CurrentState = uninitialized;
static uint8_t dir;

uint8_t InitAttack(uint8_t _dir) {
  printf("function call: InitAttack\r\n");
  dir = _dir;
  CurrentState = warming_up;
  ES_Timer_InitTimer(WARMUP_TIMER, WARMUP_TIMEOUT);
  robot_gun_start();
  return TRUE;
}

ES_Event RunAttack(ES_Event ThisEvent) {
  AttackState nextState;
  uint8_t makeTransition = FALSE;

  ES_Tattle();

  switch (CurrentState) {
    case warming_up:
      switch (ThisEvent.EventType) {
        case ES_TIMEOUT:
          if (ThisEvent.EventParam == WARMUP_TIMER) {
            printf("timeout in warming_up\r\n");
            nextState = beacon_aligning;
            makeTransition = TRUE;
          }
          break;

        case ES_EXIT:
          printf("exit from warming_up\r\n");
          break;
      }
      break;

    case beacon_aligning:
      ThisEvent = RunBeaconAlign(ThisEvent);
      switch (ThisEvent.EventType) {
        case ES_ENTRY:
          printf("entry to Attack/beacon_aligning\r\n");
          InitBeaconAlign();
          break;

        case BEACON_ALIGN_DONE:
          printf("done aligning beacon, now shooting shots_per_position[%d] = %d shots\r\n",
              current_position, shots_per_position[current_position]);
          InitShootN(shots_per_position[current_position]);
          nextState = shooting;
          makeTransition = TRUE;
          break;
      }
      break;

    case shooting:
      ThisEvent = RunShootN(ThisEvent);
      if (ThisEvent.EventType == SHOOTN_DONE) {
        current_position++;
        if (current_position == num_positions) {
          nextState = done;
        } else {
          nextState = edge_aligning;
        }
        makeTransition = TRUE;
      }
      break;

    case edge_aligning:
      switch (ThisEvent.EventType) {
        case ES_ENTRY:
          printf("entry to Attack/edge_aligning\r\n");
          if (dir == LEFT)
            robot_ccw(500);
          else
            robot_cw(500);
          break;

        case TAPE_L:
          if (dir == LEFT && ThisEvent.EventParam == ON_WHITE) {
            nextState = finding_next_position;
            InitEdgeFollower(LEFT);
            makeTransition = TRUE;
          }
          break;

        case TAPE_R:
          if (dir == RIGHT && ThisEvent.EventParam == ON_WHITE) {
            nextState = finding_next_position;
            InitEdgeFollower(RIGHT);
            makeTransition = TRUE;
          }
          break;
      }
      break;

    case finding_next_position:
      ThisEvent = RunEdgeFollower(ThisEvent);
      switch (ThisEvent.EventType) {
        case ES_ENTRY:
          printf("entry to Attack/finding_next_position\r\n");
          ES_Timer_InitTimer(NEXT_POSITION_TIMER, FIELD_WIDTH/num_positions);
          break;

        case ES_TIMEOUT:
          if (ThisEvent.EventParam == NEXT_POSITION_TIMER) {
            printf("timeout in Attack/finding_next_position\r\n");
            nextState = beacon_aligning;
            makeTransition = TRUE;
          }
          break;

        case EDGE_FOLLOW_DONE:
          printf("Edge Follower finished, we shouldn't hit the edge...\r\n");
          break;
      }
      break;

    case done:
      if (ThisEvent.EventType == ES_ENTRY) {
        robot_gun_stop();
      }
      break;
  }

  if (makeTransition) {
    RunAttack((ES_Event){.EventType = ES_EXIT});
    CurrentState = nextState;
    RunAttack((ES_Event){.EventType = ES_ENTRY});
  }

  ES_Tail();
  return ThisEvent;
}
