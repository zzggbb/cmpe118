#include <xc.h>
#include <stdio.h>

#include "BOARD.h"
#include "pwm.h"
#include "ES_Configure.h"
#include "ES_Framework.h"

#include "pins.h"
#include "robot.h"

#define BEACON_EVENT_TEST 0

//#define TEST_HARNESS
//#define MOTOR_TEST
#define SENSOR_TEST
//#define GUN_TEST

void delay(uint32_t cycles){
  int i;
  for (i=0; i<cycles; i++);
}

#if BEACON_EVENT_TEST

  #define EVENTCHECKER_TEST
  #include "BeaconEventChecker.c"

#else

void main(void) {
  BOARD_Init();
  robot_init();
  ES_Timer_Init();

  printf("project: HSM\r\n");
  printf("compiled: " __DATE__ " " __TIME__ "\r\n");

#ifdef SENSOR_TEST
  for (;;) {
    printf("bump(%d %d) tape(%d %d) beacon(%d %d)\r\n",
      read_pin(BUMP_L_PIN), read_pin(BUMP_R_PIN),
      read_pin(TAPE_L_PIN), read_pin(TAPE_R_PIN),
      read_pin(BEACON_PIN), AD_ReadADPin(BEACON_ANALOG_PIN)
    );
    delay(10e5);
  }
#endif

#ifdef GUN_TEST
  printf("starting gun motors\r\n");
  robot_gun_start();
  for(;;);

  for(;;) {
    printf("loading gun\r\n");
    robot_gun_load();
    delay(1e6);

    printf("shooting gun\r\n");
    robot_gun_shoot();
    delay(1e6);

    printf("beacon up\r\n");
    //robot_beacon_up();
    delay(1e6);

    printf("beacon down\r\n");
    //robot_beacon_down();
    delay(1e6);
  }
#endif

#ifdef MOTOR_TEST
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
    robot_curve_l(500);
    delay(5e6);

    printf("curving right\r\n");
    robot_curve_r(500);
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
#endif
