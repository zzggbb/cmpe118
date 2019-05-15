#ifndef CONFIGURE_H
#define CONFIGURE_H

//#define USE_KEYBOARD_INPUT // defines for keyboard input
//#define POSTFUNCTION_FOR_KEYBOARD_INPUT SomeFakeService
#define USE_TATTLETALE
#define SUPPRESS_EXIT_ENTRY_IN_TATTLE // supress the entry and exit events

typedef enum {
    ES_NO_EVENT,
    ES_ERROR, /* indicates an error from the service */
    ES_INIT, /* used to transition from initial pseudo-state */
    ES_ENTRY, /* used to enter a state*/
    ES_EXIT, /* used to exit a state*/
    ES_KEYINPUT, /* used to signify a key has been pressed*/
    ES_LISTEVENTS, /* does not get posted to fsm*/
    ES_TIMEOUT, /* signals that the timer has expired */
    ES_TIMERACTIVE, /* signals that a timer has become active */
    ES_TIMERSTOPPED, /* signals that a timer has stopped*/

    //
    // add custom events here
    //
    TAPE_L,
    TAPE_R,

    NUMBEROFEVENTS,
} ES_EventTyp_t;

static const char *EventNames[] = {
	"ES_NO_EVENT",
	"ES_ERROR",
	"ES_INIT",
	"ES_ENTRY",
	"ES_EXIT",
	"ES_KEYINPUT",
	"ES_LISTEVENTS",
	"ES_TIMEOUT",
	"ES_TIMERACTIVE",
	"ES_TIMERSTOPPED",

  //
  // add custom events here
  //
  "TAPE_L",
  "TAPE_R",

	"NUMBEROFEVENTS",
};

// This are the name of the Event checking function header file.
#define EVENT_CHECK_HEADER "TapeEventChecker.h"

// Comma separated list of event checking functions
#define EVENT_CHECK_LIST TapeEventChecker

// These are the definitions for the post functions to be executed when the
// corresponding timer expires. All 16 must be defined. If you are not using
// a timers, then you can use TIMER_UNUSED
#define TIMER_UNUSED ((pPostFunc)0)
#define TIMER0_RESP_FUNC TIMER_UNUSED
#define TIMER1_RESP_FUNC TIMER_UNUSED
#define TIMER2_RESP_FUNC TIMER_UNUSED
#define TIMER3_RESP_FUNC TIMER_UNUSED
#define TIMER4_RESP_FUNC TIMER_UNUSED
#define TIMER5_RESP_FUNC TIMER_UNUSED
#define TIMER6_RESP_FUNC TIMER_UNUSED
#define TIMER7_RESP_FUNC TIMER_UNUSED
#define TIMER8_RESP_FUNC TIMER_UNUSED
#define TIMER9_RESP_FUNC TIMER_UNUSED
#define TIMER10_RESP_FUNC TIMER_UNUSED
#define TIMER11_RESP_FUNC TIMER_UNUSED
#define TIMER12_RESP_FUNC TIMER_UNUSED
#define TIMER13_RESP_FUNC TIMER_UNUSED
#define TIMER14_RESP_FUNC TIMER_UNUSED
#define TIMER15_RESP_FUNC TIMER_UNUSED

// Give the timer numbers symbolc names to make it easier to move them
// to different timers if the need arises. Keep these definitons close to the
// definitions for the response functions to make it easire to check that
// the timer number matches where the timer event will be routed

#define MAX_NUM_SERVICES 8 // don't change this

// This macro determines that nuber of services that are *actually* used in
// a particular application. It will vary in value from 1 to MAX_NUM_SERVICES
#define NUM_SERVICES 1

// service definitions
#define SERV_0_HEADER "ES_KeyboardInput.h"
#define SERV_0_INIT InitKeyboardInput
#define SERV_0_RUN RunKeyboardInput
#define SERV_0_QUEUE_SIZE 9

#if NUM_SERVICES > 1
#define SERV_1_HEADER "TestService.h"
#define SERV_1_INIT TestServiceInit
#define SERV_1_RUN TestServiceRun
#define SERV_1_QUEUE_SIZE 3
#endif

#if NUM_SERVICES > 2
#define SERV_2_HEADER "TestService.h"
#define SERV_2_INIT TestServiceInit
#define SERV_2_RUN TestServiceRun
#define SERV_2_QUEUE_SIZE 3
#endif

#if NUM_SERVICES > 3
#define SERV_3_HEADER "TestService.h"
#define SERV_3_INIT TestServiceInit
#define SERV_3_RUN TestServiceRun
#define SERV_3_QUEUE_SIZE 3
#endif

#if NUM_SERVICES > 4
#define SERV_4_HEADER "TestService.h"
#define SERV_4_INIT TestServiceInit
#define SERV_4_RUN TestServiceRun
#define SERV_4_QUEUE_SIZE 3
#endif

#if NUM_SERVICES > 5
#define SERV_5_HEADER "TestService.h"
#define SERV_5_INIT TestServiceInit
#define SERV_5_RUN TestServiceRun
#define SERV_5_QUEUE_SIZE 3
#endif

#if NUM_SERVICES > 6
#define SERV_6_HEADER "TestService.h"
#define SERV_6_INIT TestServiceInit
#define SERV_6_RUN TestServiceRun
#define SERV_6_QUEUE_SIZE 3
#endif

#if NUM_SERVICES > 7
#define SERV_7_HEADER "TestService.h"
#define SERV_7_INIT TestServiceInit
#define SERV_7_RUN TestServiceRun
#define SERV_7_QUEUE_SIZE 3
#endif

// The name of the posting function that you want executed when a new
// keystroke is detected.
// The default initialization distributes keystrokes to all state machines
#define POST_KEY_FUNC ES_PostAll

// These are the definitions for the Distribution lists. Each definition
// should be a comma seperated list of post functions to indicate which
// services are on that distribution list.
#define NUM_DIST_LISTS 0
#if NUM_DIST_LISTS > 0
#define DIST_LIST0 PostTemplateFSM
#endif
#if NUM_DIST_LISTS > 1
#define DIST_LIST1 PostTemplateFSM
#endif
#if NUM_DIST_LISTS > 2
#define DIST_LIST2 PostTemplateFSM
#endif
#if NUM_DIST_LISTS > 3
#define DIST_LIST3 PostTemplateFSM
#endif
#if NUM_DIST_LISTS > 4
#define DIST_LIST4 PostTemplateFSM
#endif
#if NUM_DIST_LISTS > 5
#define DIST_LIST5 PostTemplateFSM
#endif
#if NUM_DIST_LISTS > 6
#define DIST_LIST6 PostTemplateFSM
#endif
#if NUM_DIST_LISTS > 7
#define DIST_LIST7 PostTemplateFSM
#endif

#endif
