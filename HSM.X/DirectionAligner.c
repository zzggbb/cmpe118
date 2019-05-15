#include "xc.h"
#include "ES_Configure.h"
#include "ES_Framework.h"

#include "DirectionAligner.h"
#include "robot.h"
#include "pins.h"

typedef enum {
  init,
  spinning,
  done,
} DirectionAlignerState;

static const char *StateNames[] = {
  "init",
  "spinning",
  "done",
};

static DirectionAlignerState CurrentState;
static uint8_t MyPriority;

uint8_t InitDirectionAligner(uint8_t priority) {
  MyPriority = priority;
  CurrentState = init;
  return ES_PostToService(MyPriority, INIT_EVENT);
}

uint8_t PostDirectionAligner(ES_Event ThisEvent) {
  return ES_PostToService(MyPriority, ThisEvent);
}

ES_Event RunDirectionAligner(ES_Event ThisEvent) {
  DirectionAlignerState nextState;
  uint8_t makeTransition = FALSE;

  ES_Tattle();

  switch (CurrentState) {
    case init:
      break;

    case spinning:
      break;

    case done:
      break;

  }

  if (makeTransition) {
    RunDirectionAligner((ES_Event){.EventType = ES_EXIT});
    CurrentState = nextState;
    RunDirectionAligner((ES_Event){.EventType = ES_ENTRY});
  }

  ES_Tail();
  return ThisEvent;
}
