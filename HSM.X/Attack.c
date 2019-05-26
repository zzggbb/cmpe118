#include <xc.h>
#include <stdio.h>

#include "ES_Configure.h"
#include "ES_Framework.h"

#include "Attack.h"
#include "robot.h"
#include "pins.h"

#define WARMUP_TIMEOUT 10000 // milliseconds
#define FIRING_TIMEOUT 1000 // milliseconds

typedef enum {
  uninitialized,
  warming_up,
  shooting,
  loading,
} AttackState;

static const char *StateNames[] = {
  "uninitialized",
  "warming_up",
  "shooting",
  "loading",
};

static AttackState CurrentState = uninitialized;

uint8_t InitAttack(void) {
  printf("function call: InitAttack\r\n");
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
            nextState = shooting;
            makeTransition = TRUE;
          }
          break;

        case ES_EXIT:
          printf("exit from warming_up\r\n");
          break;
      }
      break;

    case shooting:
      switch (ThisEvent.EventType) {
        case ES_ENTRY:
          printf("entry to shooting\r\n");
          robot_gun_shoot();
          ES_Timer_InitTimer(FIRING_TIMER, FIRING_TIMEOUT);
          break;

        case ES_TIMEOUT:
          if (ThisEvent.EventParam == FIRING_TIMER) {
            printf("timeout in shooting\r\n");
            nextState = loading;
            makeTransition = TRUE;
          }
          break;

        case ES_EXIT:
          printf("exit from shooting\r\n");
          break;
      }
      break;

    case loading:
      switch (ThisEvent.EventType) {
        case ES_ENTRY:
          printf("entry to loading\r\n");
          robot_gun_load();
          ES_Timer_InitTimer(FIRING_TIMER, FIRING_TIMEOUT);
          break;

        case ES_TIMEOUT:
          if (ThisEvent.EventParam == FIRING_TIMER) {
            printf("timeout in loading\r\n");
            nextState = shooting;
            makeTransition = TRUE;
          }
          break;

        case ES_EXIT:
          printf("exit from loading\r\n");
          break;
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
