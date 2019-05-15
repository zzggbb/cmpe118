#ifndef DirectionAligner_H
#define DirectionAligner_H
uint8_t InitDirectionAligner(uint8_t priority);
uint8_t PostDirectionAligner(ES_Event ThisEvent);
ES_Event RunDirectionAligner(ES_Event ThisEvent);
#endif
