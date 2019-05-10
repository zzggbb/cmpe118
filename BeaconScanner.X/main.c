#include <xc.h>
#include <stdio.h>
#include "BOARD.h"
#include "ES_Configure.h"
#include "ES_Framework.h"

void main(void) {
  BOARD_Init();
  printf("project: BeaconScanner\r\n");
  printf("compiled: " __DATE__ " " __TIME__ "\r\n");
  printf("starting es framework\r\n");

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
