#include "ES_Configure.h"
#include "BeaconEventChecker.h"
#include "ES_Events.h"
#include "serial.h"

#define BEACON_PORT PORTDbits.RD5
#define BEACON_TRIS TRISDbits.TRISD5

#ifdef EVENTCHECKER_TEST
#include <stdio.h>
#define SaveEvent(x) do {eventName=__func__;storedEvent=x;} while (0)
static const char *eventName;
static ES_Event storedEvent;
#endif

uint8_t CheckBeacon(void) {
  static uint8_t last_beacon_reading = 0xFF;

  if (last_beacon_reading == 0xFF)
    last_beacon_reading = BEACON_PORT

  uint8_t current_beacon_reading = BEACON_PORT;

  if (last_beacon_reading != current_beacon_reading) {
    ES_Event event = {
      .EventType = BEACON_CHANGE,
      .EventParam = current_beacon_reading;
    }

#ifdef EVENTCHECKER_TEST
    SaveEvent(event);
#else
    PostGenericService(event);
#endif

    last_beacon_reading = current_beacon_reading;
    return TRUE;
  }
  return FALSE;
}

#ifdef EVENTCHECKER_TEST
#include <stdio.h>
static uint8_t(*EventList[])(void) = {EVENT_CHECK_LIST};
void PrintEvent(void) {
  printf("func: %s event: %s param: 0x%X\r\n", eventName,
      EventNames[storedEvent.EventType], storedEvent.EventParam);
}
void main(void) {
  BEACON_TRIS = 1;

  int i;
  for (;;) {
    if (IsTransmitEmpty()) {
      for (i=0; i<sizeof(EventList) >> 2; i++) {
        if (EventList[i]() == TRUE) {
          PrintEvent();
          break;
        }
      }
    }
  }
}
#endif
