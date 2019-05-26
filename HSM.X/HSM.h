#ifndef HSM_H
#define HSM_H
uint8_t InitHSM(uint8_t priority);
uint8_t PostHSM(ES_Event ThisEvent);
ES_Event RunHSM(ES_Event ThisEvent);
#endif
