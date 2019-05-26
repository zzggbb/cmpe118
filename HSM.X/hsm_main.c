#include <xc.h>
#include <stdio.h>

#include "BOARD.h"
#include "pwm.h"
#include "ES_Configure.h"
#include "ES_Framework.h"

#include "pins.h"
#include "robot.h"

//#define TEST_HARNESS
//#define MOTOR_TEST

void delay(uint32_t cycles){
  int i;
  for (i=0; i<cycles; i++);
}

void main(void) {
  BOARD_Init();
  robot_init();
  ES_Timer_Init();

  printf("project: HSM\r\n");
  printf("compiled: " __DATE__ " " __TIME__ "\r\n");

#ifdef MOTOR_TEST
  uint32_t speed;
  for(;;) {
    for (speed = 500; speed >= 0; speed -= 25) {
      printf("speed = %d\r\n", speed);
      robot_curve_l(speed);
      delay(1e6);
    }
  }
#endif

#ifdef TEST_HARNESS
  for (;;) {
    printf("going forward\r\n");
    robot_fwd(500);
    delay(5e6);

    printf("going backwards\r\n");
    robot_rev(500);
    delay(5e6);

    printf("going cw\r\n");
    robot_cw(500);
    delay(5e6);

    printf("going ccw\r\n");
    robot_ccw(500);
    delay(5e6);

    printf("curving left\r\n");
    robot_curve_l();
    delay(5e6);

    printf("curving right\r\n");
    robot_curve_r();
    delay(5e6);
  }

#endif

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
