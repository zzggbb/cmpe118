#include "xc.h"
#include "BOARD.h"
#include "robot.h"
#include "pwm.h"
#include "AD.h"
#include "RC_Servo.h"

static float current_gun_pitch;

int linear_scale(int x, int x1, int x2, int y1, int y2) {
  return (y2-y1) / (x2 - x1) * (x - x2) + y2;
}

void robot_init(void) {
  // initialize drive motors
  PWM_Init();
  PWM_SetFrequency(MOTOR_PWM_FREQ);
  PWM_AddPins(L_MOTOR_PWM | R_MOTOR_PWM);
  L_MOTOR_DIR_TRI = 0;
  R_MOTOR_DIR_TRI = 0;
  robot_stop();

  // initialize gun aiming servo motors
  RC_Init();
  RC_AddPins(GUN_PITCH_RC);
  robot_gun_pitch(0);

  // initialize AD system for tape sensor
  AD_Init();
  AD_AddPins(L_TAPE | R_TAPE);
}

// drive robot forward
void robot_fwd(void) {
  PWM_SetDutyCycle(L_MOTOR_PWM, 500);
  PWM_SetDutyCycle(R_MOTOR_PWM, 500);
  L_MOTOR_DIR_LAT = MOTOR_DIR_FWD;
  R_MOTOR_DIR_LAT = MOTOR_DIR_FWD;
}

// drive robot backwards
void robot_rev(void) {
  PWM_SetDutyCycle(L_MOTOR_PWM, 500);
  PWM_SetDutyCycle(R_MOTOR_PWM, 500);
  L_MOTOR_DIR_LAT = MOTOR_DIR_REV;
  R_MOTOR_DIR_LAT = MOTOR_DIR_REV;
}

// rotate robot clockwise
void robot_cw(void) {
  PWM_SetDutyCycle(L_MOTOR_PWM, 500);
  PWM_SetDutyCycle(R_MOTOR_PWM, 500);
  L_MOTOR_DIR_LAT = MOTOR_DIR_FWD;
  R_MOTOR_DIR_LAT = MOTOR_DIR_REV;
}

// rotate robot counter clockwise
void robot_ccw(void) {
  PWM_SetDutyCycle(L_MOTOR_PWM, 500);
  PWM_SetDutyCycle(R_MOTOR_PWM, 500);
  L_MOTOR_DIR_LAT = MOTOR_DIR_REV;
  R_MOTOR_DIR_LAT = MOTOR_DIR_FWD;
}

// cut power to both drive motors
void robot_stop(void) {
  PWM_SetDutyCycle(L_MOTOR_PWM, 0);
  PWM_SetDutyCycle(R_MOTOR_PWM, 0);
  L_MOTOR_DIR_LAT = 0;
  R_MOTOR_DIR_LAT = 0;
}

// move gun pitch to an absolute angle
void robot_gun_pitch(float angle) {
  if (angle < GUN_PITCH_MIN) angle = GUN_PITCH_MIN;
  if (angle > GUN_PITCH_MAX) angle = GUN_PITCH_MAX;

  unsigned short int pulse_time = linear_scale(
    angle, GUN_PITCH_MIN, GUN_PITCH_MAX, GUN_PULSE_MIN, GUN_PULSE_MAX
  );

  RC_SetPulseTime(GUN_PITCH_RC, pulse_time);

  current_gun_pitch = angle;
}

// move gun pitch up or down relative to the current gun pitch
void robot_gun_pitch_adjust(float angle) {
  robot_gun_pitch(current_gun_pitch + angle);
}
