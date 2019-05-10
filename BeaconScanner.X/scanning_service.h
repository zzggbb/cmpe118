#ifndef SCANNING_SERVICE_H
#define SCANNING_SERVICE_H
#include "ES_Events.h"
uint8_t init_scanning_service(uint8_t priority);
uint8_t post_scanning_service(ES_Event event);
ES_Event run_scanning_service(ES_Event event);
#endif
