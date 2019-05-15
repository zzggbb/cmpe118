test $# -ge 1 || {
  echo "usage: $(basename $0) <name> <states>..."
  echo "example: $(basename $0) DirectionAligner init spinning done"
  exit 1
}
name="$1"
shift
states="$@"

make_c_file(){
cat <<EOF
#include "xc.h"
#include "ES_Configure.h"
#include "ES_Framework.h"

#include "$name.h"
#include "robot.h"
#include "pins.h"

typedef enum {
EOF

# create state enum
for state in $states; do
  echo "  $state,"
done

cat <<EOF
} ${name}State;

static const char *StateNames[] = {
EOF

for state in $states; do
  echo "  \"$state\","
done

cat <<EOF
};

static ${name}State CurrentState;
static uint8_t MyPriority;

uint8_t Init${name}(uint8_t priority) {
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
EOF

for state in $states; do
cat<<EOF
    case $state:
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
