#ifndef EDGE_FOLLOWER_H
#define EDGE_FOLLOWER_H

uint8_t InitEdgeFollower(uint8_t priority);
uint8_t PostEdgeFollower(ES_Event ThisEvent);
ES_Event RunEdgeFollower(ES_Event ThisEvent);

#endif
