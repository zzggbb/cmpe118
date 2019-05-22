#include "xc.h"

#include "BOARD.h"
#include "pwm.h"
#include "AD.h"
#include "RC_Servo.h"

#include "robot.h"
#include "pins.h"

static float current_gun_pitch;

int linear_scale(int x, int x1, int x2, int y1, int y2) {
  return (y2-y1) / (x2 - x1) * (x - x2) + y2;
}

void robot_init(void) {
  // initialize drive motors
  PWM_Init();
  PWM_SetFrequency(MOTOR_PWM_FREQ);
  PWM_AddPins(L_MOTOR_PWM | R_MOTOR_PWM | GUN_MOTOR);
  L_MOTOR_DIR_TRI = 0;
  R_MOTOR_DIR_TRI = 0;
  robot_stop();

  // initialize gun aiming servo motors
  RC_Init();
  RC_AddPins(GUN_PITCH_RC);

  // initialize tape pins
  set_tris(TAPE_L_PIN, TRIS_INPUT);
  set_tris(TAPE_R_PIN, TRIS_INPUT);

  // initialize bump pins
  set_tris(BUMP_L_PIN, TRIS_INPUT);
  set_tris(BUMP_R_PIN, TRIS_INPUT);

  // initialize beacon pins
  set_tris(BEACON_PIN, TRIS_INPUT);
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

void robot_curve_l(void) {
  PWM_SetDutyCycle(L_MOTOR_PWM, 350);
  PWM_SetDutyCycle(R_MOTOR_PWM, 500);
  L_MOTOR_DIR_LAT = MOTOR_DIR_FWD;
  R_MOTOR_DIR_LAT = MOTOR_DIR_FWD;
}

void robot_curve_r(void) {
  PWM_SetDutyCycle(L_MOTOR_PWM, 500);
  PWM_SetDutyCycle(R_MOTOR_PWM, 350);
  L_MOTOR_DIR_LAT = MOTOR_DIR_FWD;
  R_MOTOR_DIR_LAT = MOTOR_DIR_FWD;
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
