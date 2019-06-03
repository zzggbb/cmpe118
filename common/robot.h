#ifndef ROBOT_H
#define ROBOT_H

#include "RC_Servo.h"
#include "pwm.h"
#include "AD.h"

#define FAKE_BEACON 0

#define EventMatch(e,t,p) (e.EventType == t && e.EventParam == p)

#define TRIS_INPUT 1
#define TRIS_OUTPUT 0

#define FALSE 0
#define TRUE 1

#define LEFT 0
#define RIGHT 1

#define CW 0
#define CCW 1

#define MOTOR_PWM_FREQ 1000
#define MOTOR_DIR_FWD 0
#define MOTOR_DIR_REV 1

// TODO: calibrate these based on actual servo tests
#define GUN_PULSE_MIN 1500 // RC pulse time corresponding to minimum angle
#define GUN_PULSE_MAX 1700 // RC pulse time corresponding to maximum angle

#define R_MOTOR_DIR_TRI TRISDbits.TRISD8  // silk pin 2
#define R_MOTOR_DIR_LAT LATDbits.LATD8    // silk pin 2
#define R_MOTOR_PWM PWM_PORTZ06           // silk pin 3

#define L_MOTOR_DIR_TRI TRISFbits.TRISF1  // silk pin 4
#define L_MOTOR_DIR_LAT LATFbits.LATF1    // silk pin 4
#define L_MOTOR_PWM PWM_PORTY12           // silk pin 5

#define GUN_MOTOR_L PWM_PORTY10 // silk pin 6
#define GUN_MOTOR_R PWM_PORTX11 // silk pin 10

#define BEACON_POP_RC RC_PORTY06 // silk pin 8
#define GUN_LOADER_RC RC_PORTZ09 // silk pin 33

#define FAKE_BEACON_PIN 34

#if FAKE_BEACON
  #define BEACON_PIN 7
#else
  #define BEACON_PIN FAKE_BEACON_PIN
#endif

#define BEACON_ANALOG_PIN AD_PORTV7

#define TAPE_L_PIN 7
#define TAPE_R_PIN 31

#define BUMP_L_PIN 28
#define BUMP_R_PIN 29

void robot_init(void);
void robot_fwd(uint32_t speed);
void robot_rev(uint32_t speed);
void robot_cw(uint32_t speed);
void robot_ccw(uint32_t speed);
void robot_curve_l(uint32_t speed);
void robot_curve_r(uint32_t speed);
void robot_stop(void);
void robot_gun_start(void);
void robot_gun_stop(void);
void robot_gun_load(void);
void robot_gun_shoot(void);
void robot_beacon_up(void);
void robot_beacon_down(void);

#endif
