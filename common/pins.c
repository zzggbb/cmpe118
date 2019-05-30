#include "pins.h"
#include "xc.h"

uint8_t read_pin(uint8_t pin) {
  switch (pin) {
    case 5: return PORTDbits.RD1;
    case 7: return PORTDbits.RD9;
    case 28: return PORTEbits.RE2;
    case 29: return PORTEbits.RE3;
    case 31: return PORTEbits.RE5;
    case 32: return PORTEbits.RE6;
    case 33: return PORTEbits.RE7;
    case 34: return PORTDbits.RD5;
    case 37: return PORTDbits.RD7;
    case 38: return PORTFbits.RF6;
  }
}

void set_tris(uint8_t pin, uint8_t dir) {
  switch (pin) {
    case 5: TRISDbits.TRISD1 = dir;
    case 7: TRISDbits.TRISD9 = dir;
    case 28: TRISEbits.TRISE2 = dir;
    case 29: TRISEbits.TRISE3 = dir;
    case 31: TRISEbits.TRISE5 = dir;
    case 32: TRISEbits.TRISE6 = dir;
    case 33: TRISEbits.TRISE7 = dir;
    case 34: TRISDbits.TRISD5 = dir;
    case 37: TRISDbits.TRISD7 = dir;
    case 38: TRISFbits.TRISF6 = dir;
  }
}
