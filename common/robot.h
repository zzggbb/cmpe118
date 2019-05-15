#ifndef ROBOT_H
#define ROBOT_H

#define FALSE 0
#define TRUE 1

#define MOTOR_PWM_FREQ 1000
#define MOTOR_DIR_FWD 1
#define MOTOR_DIR_REV 0

#define GUN_PITCH_MIN -30
#define GUN_PITCH_MAX 30

// TODO: calibrate these based on actual servo tests
#define GUN_PULSE_MIN 1500 // RC pulse time corresponding to minimum angle
#define GUN_PULSE_MAX 1700 // RC pulse time corresponding to maximum angle

#define L_MOTOR_DIR_TRI TRISDbits.TRISD8  // silk pin 2
#define L_MOTOR_DIR_LAT LATDbits.LATD8    // silk pin 2
#define L_MOTOR_PWM PWM_PORTZ06           // silk pin 3

#define R_MOTOR_DIR_TRI TRISFbits.TRISF1  // silk pin 4
#define R_MOTOR_DIR_LAT LATFbits.LATF1    // silk pin 4
#define R_MOTOR_PWM PWM_PORTY12           // silk pin 5

#define GUN_MOTOR_PWM_PORTY10 // silk pin 6
#define GUN_PITCH_RC RC_PORTX03   // silk pin 40

#define BEACON_TRI TRISDbits.TRISD5 // silk pin 34
#define BEACON_LAT LATDbits.LATD5   // silk pin 34

#define L_BUMP_TRI TRISDbits.TRISD7 // silk pin 37
#define L_BUMP_PRT PORTDbits.RD7 // silk pin 37

#define R_BUMP_TRI TRISFbits.TRISF6 // silk pin 38
#define R_BUMP_PRT PORTFbits.RF6 // silk pin 38

#define L_TAPE AD_PORTV3
#define R_TAPE AD_PORTV5

void robot_init(void);
void robot_fwd(void);
void robot_rev(void);
void robot_cw(void);
void robot_ccw(void);
void robot_curve_l(void);
void robot_curve_r(void);
void robot_stop(void);
void robot_gun_pitch(float angle);
void robot_gun_pitch_up(float angle);

#endif
