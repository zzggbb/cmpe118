test $# -ge 2 || {
  echo "usage: $(basename $0) fsm-name state-name1 state-name2 ... state-nameN"
  echo "example: $(basename $0) DirectionAligner init spinning done"
  exit 1
}
name="$1"
shift
first_state="$1"
states="$@"

make_c_file(){
cat <<EOF
#include <xc.h>
#include <stdio.h>

#include "ES_Configure.h"
#include "ES_Framework.h"

#include "$name.h"
#include "robot.h"
#include "pins.h"

typedef enum {
  init,
EOF

# create state enum
for state in $states; do
  echo "  $state,"
done

cat <<EOF
} ${name}State;

static const char *StateNames[] = {
  "init",
EOF

for state in $states; do
  echo "  \"$state\","
done

cat <<EOF
};

static ${name}State CurrentState;
static uint8_t MyPriority;

uint8_t Init${name}(uint8_t priority) {
  printf("function call: Init${name}\r\n");
  MyPriority = priority;
  CurrentState = init;
  return ES_PostToService(MyPriority, INIT_EVENT);
}

uint8_t Post${name}(ES_Event ThisEvent) {
  return ES_PostToService(MyPriority, ThisEvent);
}

ES_Event Run${name}(ES_Event ThisEvent) {
  ${name}State nextState;
  uint8_t makeTransition = FALSE;

  ES_Tattle();

  switch (CurrentState) {
    case init:
      if (ThisEvent.EventType == ES_INIT) {
        nextState = $first_state;
        makeTransition = TRUE;
      }
      break;

EOF

for state in $states; do
cat<<EOF
    case $state:
      switch (ThisEvent.EventType) {
        case ES_ENTRY:
          printf("entry to $state\r\n");
          break;

        case ES_TIMEOUT:
          printf("timeout in $state\r\n");
          break;

        case ES_EXIT:
          printf("exit from $state\r\n");
          break;
      }
      break;

EOF
done

cat <<EOF
  }

  if (makeTransition) {
    Run${name}((ES_Event){.EventType = ES_EXIT});
    CurrentState = nextState;
    Run${name}((ES_Event){.EventType = ES_ENTRY});
  }

  ES_Tail();
  return ThisEvent;
}
EOF
}

make_h_file(){
cat<<EOF
#ifndef ${name}_H
#define ${name}_H
uint8_t Init${name}(uint8_t priority);
uint8_t Post${name}(ES_Event ThisEvent);
ES_Event Run${name}(ES_Event ThisEvent);
#endif
EOF
}

make_c_file > ${name}.c
make_h_file > ${name}.h
