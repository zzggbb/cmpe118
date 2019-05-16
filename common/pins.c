#include "pins.h"
#include "xc.h"

uint8_t read_pin(uint8_t pin) {
  switch (pin) {
    case 32: return PORTEbits.RE6;
    case 33: return PORTEbits.RE7;
    case 34: return PORTDbits.RD5;
    case 37: return PORTDbits.RD7;
    case 38: return PORTFbits.RF6;
  }
}

void set_tris(uint8_t pin, uint8_t dir) {
  switch (pin) {
    case 32: TRISEbits.TRISE6 = dir;
    case 33: TRISEbits.TRISE7 = dir;
    case 34: TRISDbits.TRISD5 = dir;
    case 37: TRISDbits.TRISD7 = dir;
    case 38: TRISFbits.TRISF6 = dir;
  }
}
