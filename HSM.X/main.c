#include <xc.h>
#include <stdio.h>

#include "BOARD.h"
#include "ES_Configure.h"
#include "ES_Framework.h"

#include "pins.h"
#include "robot.h"

void delay(void){
  int i;
  for (i=0; i<1e5; i++);
}

void main(void) {
  BOARD_Init();
  robot_init();

  printf("project: HSM\r\n");
  printf("compiled: " __DATE__ " " __TIME__ "\r\n");
  printf("starting es framework\r\n");
  printf("you have %d services\r\n", NUM_SERVICES);

  ES_Return_t ErrorType = ES_Initialize();
  if (ErrorType == Success)
    ErrorType = ES_Run();

  // ES_Run is an infinite loop, and only breaks if an error occurs
  switch(ErrorType) {
    case FailedPointer:
      printf("Failed on NULL pointer");
      break;
    case FailedInit:
      printf("Failed Initialization");
    default:
      printf("Other Failure: %d", ErrorType);
      break;
  }

  for (;;);
}
