#include "xc.h"

#include "BOARD.h"
#include "pwm.h"
#include "AD.h"
#include "RC_Servo.h"

#include "robot.h"
#include "pins.h"

#define MOTOR_PWM_MAX 0
#define MOTOR_PWM_MIN 400

int linear_scale(int x, int x1, int x2, int y1, int y2) {
  return (y2-y1) / (x2 - x1) * (x - x2) + y2;
}

uint32_t clip_speed(uint32_t speed) {
  if (speed > 1000)
    speed = 1000;

  speed = 1000 - speed;
  return speed;
}

uint32_t battery_voltage(void) {
  // maximum battery voltage is
  unsigned int reading = AD_ReadADPin(BATTERY_VOLTAGE_PIN);

}

void robot_init(void) {
  // initialize drive motors and gun motors
  PWM_Init();
  PWM_SetFrequency(MOTOR_PWM_FREQ);
  PWM_AddPins(L_MOTOR_PWM | R_MOTOR_PWM | GUN_MOTOR_L | GUN_MOTOR_R);
  L_MOTOR_DIR_TRI = 0;
  R_MOTOR_DIR_TRI = 0;
  PWM_SetDutyCycle(GUN_MOTOR_L, 0);
  PWM_SetDutyCycle(GUN_MOTOR_R, 0);
  robot_stop();

  // initialize battery measuring
  AD_Init();
  AD_AddPins(BATTERY_VOLTAGE_PIN);

  // initialize gun loading servo motor
  RC_Init();
  RC_AddPins(GUN_LOADER_RC);
  robot_gun_load();

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
void robot_fwd(uint32_t speed) {
  speed = clip_speed(speed);
  PWM_SetDutyCycle(L_MOTOR_PWM, speed);
  PWM_SetDutyCycle(R_MOTOR_PWM, speed);
  L_MOTOR_DIR_LAT = MOTOR_DIR_REV;
  R_MOTOR_DIR_LAT = MOTOR_DIR_REV;
}

// drive robot backwards
void robot_rev(uint32_t speed) {
  speed = clip_speed(speed);
  PWM_SetDutyCycle(L_MOTOR_PWM, speed);
  PWM_SetDutyCycle(R_MOTOR_PWM, speed);
  L_MOTOR_DIR_LAT = MOTOR_DIR_FWD;
  R_MOTOR_DIR_LAT = MOTOR_DIR_FWD;
}

// rotate robot clockwise
void robot_cw(uint32_t speed) {
  speed = clip_speed(speed);
  PWM_SetDutyCycle(L_MOTOR_PWM, speed);
  PWM_SetDutyCycle(R_MOTOR_PWM, speed);
  L_MOTOR_DIR_LAT = MOTOR_DIR_FWD;
  R_MOTOR_DIR_LAT = MOTOR_DIR_REV;
}

// rotate robot counter clockwise
void robot_ccw(uint32_t speed) {
  speed = clip_speed(speed);
  PWM_SetDutyCycle(L_MOTOR_PWM, speed);
  PWM_SetDutyCycle(R_MOTOR_PWM, speed);
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

void robot_curve_l(uint32_t speed) {
  PWM_SetDutyCycle(L_MOTOR_PWM, 100);
  PWM_SetDutyCycle(R_MOTOR_PWM, speed);
  L_MOTOR_DIR_LAT = MOTOR_DIR_REV;
  R_MOTOR_DIR_LAT = MOTOR_DIR_REV;
}

void robot_curve_r(uint32_t speed) {
  PWM_SetDutyCycle(L_MOTOR_PWM, speed);
  PWM_SetDutyCycle(R_MOTOR_PWM, 100);
  L_MOTOR_DIR_LAT = MOTOR_DIR_REV;
  R_MOTOR_DIR_LAT = MOTOR_DIR_REV;
}

void robot_gun_start(void) {
  PWM_SetDutyCycle(GUN_MOTOR_L, 300);
  PWM_SetDutyCycle(GUN_MOTOR_R, 300);
}

void robot_gun_stop(void) {
  PWM_SetDutyCycle(GUN_MOTOR_L, 0);
  PWM_SetDutyCycle(GUN_MOTOR_R, 0);
}

void robot_gun_load(void) {
  RC_SetPulseTime(GUN_LOADER_RC, 1000);
}

void robot_gun_shoot(void) {
  RC_SetPulseTime(GUN_LOADER_RC, 2000);
}
