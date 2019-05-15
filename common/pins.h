#ifndef PINS_H
#define PINS_H
#include "xc.h"
uint8_t read_pin(uint8_t pin);
void set_tris(uint8_t pin, uint8_t dir);
#endif
