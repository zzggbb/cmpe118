#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-default.mk)" "nbproject/Makefile-local-default.mk"
include nbproject/Makefile-local-default.mk
endif
endif

# Environment
MKDIR=mkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/TapeEventChecker.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/TapeEventChecker.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=-mafrlcsj
else
COMPARISON_BUILD=
endif

ifdef SUB_IMAGE_ADDRESS

else
SUB_IMAGE_ADDRESS_COMMAND=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=../common/AD.c ../common/BOARD.c ../common/ES_CheckEvents.c ../common/ES_Framework.c ../common/ES_KeyboardInput.c ../common/ES_PostList.c ../common/ES_Queue.c ../common/ES_TattleTale.c ../common/ES_Timers.c ../common/IO_Ports.c ../common/LED.c ../common/pwm.c ../common/RC_Servo.c ../common/roach.c ../common/robot.c ../common/serial.c ../common/timers.c TapeEventChecker.c ../common/pins.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/1270477542/AD.o ${OBJECTDIR}/_ext/1270477542/BOARD.o ${OBJECTDIR}/_ext/1270477542/ES_CheckEvents.o ${OBJECTDIR}/_ext/1270477542/ES_Framework.o ${OBJECTDIR}/_ext/1270477542/ES_KeyboardInput.o ${OBJECTDIR}/_ext/1270477542/ES_PostList.o ${OBJECTDIR}/_ext/1270477542/ES_Queue.o ${OBJECTDIR}/_ext/1270477542/ES_TattleTale.o ${OBJECTDIR}/_ext/1270477542/ES_Timers.o ${OBJECTDIR}/_ext/1270477542/IO_Ports.o ${OBJECTDIR}/_ext/1270477542/LED.o ${OBJECTDIR}/_ext/1270477542/pwm.o ${OBJECTDIR}/_ext/1270477542/RC_Servo.o ${OBJECTDIR}/_ext/1270477542/roach.o ${OBJECTDIR}/_ext/1270477542/robot.o ${OBJECTDIR}/_ext/1270477542/serial.o ${OBJECTDIR}/_ext/1270477542/timers.o ${OBJECTDIR}/TapeEventChecker.o ${OBJECTDIR}/_ext/1270477542/pins.o
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/1270477542/AD.o.d ${OBJECTDIR}/_ext/1270477542/BOARD.o.d ${OBJECTDIR}/_ext/1270477542/ES_CheckEvents.o.d ${OBJECTDIR}/_ext/1270477542/ES_Framework.o.d ${OBJECTDIR}/_ext/1270477542/ES_KeyboardInput.o.d ${OBJECTDIR}/_ext/1270477542/ES_PostList.o.d ${OBJECTDIR}/_ext/1270477542/ES_Queue.o.d ${OBJECTDIR}/_ext/1270477542/ES_TattleTale.o.d ${OBJECTDIR}/_ext/1270477542/ES_Timers.o.d ${OBJECTDIR}/_ext/1270477542/IO_Ports.o.d ${OBJECTDIR}/_ext/1270477542/LED.o.d ${OBJECTDIR}/_ext/1270477542/pwm.o.d ${OBJECTDIR}/_ext/1270477542/RC_Servo.o.d ${OBJECTDIR}/_ext/1270477542/roach.o.d ${OBJECTDIR}/_ext/1270477542/robot.o.d ${OBJECTDIR}/_ext/1270477542/serial.o.d ${OBJECTDIR}/_ext/1270477542/timers.o.d ${OBJECTDIR}/TapeEventChecker.o.d ${OBJECTDIR}/_ext/1270477542/pins.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/1270477542/AD.o ${OBJECTDIR}/_ext/1270477542/BOARD.o ${OBJECTDIR}/_ext/1270477542/ES_CheckEvents.o ${OBJECTDIR}/_ext/1270477542/ES_Framework.o ${OBJECTDIR}/_ext/1270477542/ES_KeyboardInput.o ${OBJECTDIR}/_ext/1270477542/ES_PostList.o ${OBJECTDIR}/_ext/1270477542/ES_Queue.o ${OBJECTDIR}/_ext/1270477542/ES_TattleTale.o ${OBJECTDIR}/_ext/1270477542/ES_Timers.o ${OBJECTDIR}/_ext/1270477542/IO_Ports.o ${OBJECTDIR}/_ext/1270477542/LED.o ${OBJECTDIR}/_ext/1270477542/pwm.o ${OBJECTDIR}/_ext/1270477542/RC_Servo.o ${OBJECTDIR}/_ext/1270477542/roach.o ${OBJECTDIR}/_ext/1270477542/robot.o ${OBJECTDIR}/_ext/1270477542/serial.o ${OBJECTDIR}/_ext/1270477542/timers.o ${OBJECTDIR}/TapeEventChecker.o ${OBJECTDIR}/_ext/1270477542/pins.o

# Source Files
SOURCEFILES=../common/AD.c ../common/BOARD.c ../common/ES_CheckEvents.c ../common/ES_Framework.c ../common/ES_KeyboardInput.c ../common/ES_PostList.c ../common/ES_Queue.c ../common/ES_TattleTale.c ../common/ES_Timers.c ../common/IO_Ports.c ../common/LED.c ../common/pwm.c ../common/RC_Servo.c ../common/roach.c ../common/robot.c ../common/serial.c ../common/timers.c TapeEventChecker.c ../common/pins.c


CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-default.mk dist/${CND_CONF}/${IMAGE_TYPE}/TapeEventChecker.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=32MX320F128H
MP_LINKER_FILE_OPTION=,--script="../common/bootloader320.ld"
# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assembleWithPreprocess
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/1270477542/AD.o: ../common/AD.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1270477542" 
	@${RM} ${OBJECTDIR}/_ext/1270477542/AD.o.d 
	@${RM} ${OBJECTDIR}/_ext/1270477542/AD.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1270477542/AD.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"../common" -I"." -MMD -MF "${OBJECTDIR}/_ext/1270477542/AD.o.d" -o ${OBJECTDIR}/_ext/1270477542/AD.o ../common/AD.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1270477542/BOARD.o: ../common/BOARD.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1270477542" 
	@${RM} ${OBJECTDIR}/_ext/1270477542/BOARD.o.d 
	@${RM} ${OBJECTDIR}/_ext/1270477542/BOARD.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1270477542/BOARD.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"../common" -I"." -MMD -MF "${OBJECTDIR}/_ext/1270477542/BOARD.o.d" -o ${OBJECTDIR}/_ext/1270477542/BOARD.o ../common/BOARD.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1270477542/ES_CheckEvents.o: ../common/ES_CheckEvents.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1270477542" 
	@${RM} ${OBJECTDIR}/_ext/1270477542/ES_CheckEvents.o.d 
	@${RM} ${OBJECTDIR}/_ext/1270477542/ES_CheckEvents.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1270477542/ES_CheckEvents.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"../common" -I"." -MMD -MF "${OBJECTDIR}/_ext/1270477542/ES_CheckEvents.o.d" -o ${OBJECTDIR}/_ext/1270477542/ES_CheckEvents.o ../common/ES_CheckEvents.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1270477542/ES_Framework.o: ../common/ES_Framework.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1270477542" 
	@${RM} ${OBJECTDIR}/_ext/1270477542/ES_Framework.o.d 
	@${RM} ${OBJECTDIR}/_ext/1270477542/ES_Framework.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1270477542/ES_Framework.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"../common" -I"." -MMD -MF "${OBJECTDIR}/_ext/1270477542/ES_Framework.o.d" -o ${OBJECTDIR}/_ext/1270477542/ES_Framework.o ../common/ES_Framework.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1270477542/ES_KeyboardInput.o: ../common/ES_KeyboardInput.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1270477542" 
	@${RM} ${OBJECTDIR}/_ext/1270477542/ES_KeyboardInput.o.d 
	@${RM} ${OBJECTDIR}/_ext/1270477542/ES_KeyboardInput.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1270477542/ES_KeyboardInput.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"../common" -I"." -MMD -MF "${OBJECTDIR}/_ext/1270477542/ES_KeyboardInput.o.d" -o ${OBJECTDIR}/_ext/1270477542/ES_KeyboardInput.o ../common/ES_KeyboardInput.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1270477542/ES_PostList.o: ../common/ES_PostList.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1270477542" 
	@${RM} ${OBJECTDIR}/_ext/1270477542/ES_PostList.o.d 
	@${RM} ${OBJECTDIR}/_ext/1270477542/ES_PostList.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1270477542/ES_PostList.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"../common" -I"." -MMD -MF "${OBJECTDIR}/_ext/1270477542/ES_PostList.o.d" -o ${OBJECTDIR}/_ext/1270477542/ES_PostList.o ../common/ES_PostList.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1270477542/ES_Queue.o: ../common/ES_Queue.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1270477542" 
	@${RM} ${OBJECTDIR}/_ext/1270477542/ES_Queue.o.d 
	@${RM} ${OBJECTDIR}/_ext/1270477542/ES_Queue.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1270477542/ES_Queue.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"../common" -I"." -MMD -MF "${OBJECTDIR}/_ext/1270477542/ES_Queue.o.d" -o ${OBJECTDIR}/_ext/1270477542/ES_Queue.o ../common/ES_Queue.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1270477542/ES_TattleTale.o: ../common/ES_TattleTale.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1270477542" 
	@${RM} ${OBJECTDIR}/_ext/1270477542/ES_TattleTale.o.d 
	@${RM} ${OBJECTDIR}/_ext/1270477542/ES_TattleTale.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1270477542/ES_TattleTale.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"../common" -I"." -MMD -MF "${OBJECTDIR}/_ext/1270477542/ES_TattleTale.o.d" -o ${OBJECTDIR}/_ext/1270477542/ES_TattleTale.o ../common/ES_TattleTale.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1270477542/ES_Timers.o: ../common/ES_Timers.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1270477542" 
	@${RM} ${OBJECTDIR}/_ext/1270477542/ES_Timers.o.d 
	@${RM} ${OBJECTDIR}/_ext/1270477542/ES_Timers.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1270477542/ES_Timers.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"../common" -I"." -MMD -MF "${OBJECTDIR}/_ext/1270477542/ES_Timers.o.d" -o ${OBJECTDIR}/_ext/1270477542/ES_Timers.o ../common/ES_Timers.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1270477542/IO_Ports.o: ../common/IO_Ports.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1270477542" 
	@${RM} ${OBJECTDIR}/_ext/1270477542/IO_Ports.o.d 
	@${RM} ${OBJECTDIR}/_ext/1270477542/IO_Ports.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1270477542/IO_Ports.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"../common" -I"." -MMD -MF "${OBJECTDIR}/_ext/1270477542/IO_Ports.o.d" -o ${OBJECTDIR}/_ext/1270477542/IO_Ports.o ../common/IO_Ports.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1270477542/LED.o: ../common/LED.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1270477542" 
	@${RM} ${OBJECTDIR}/_ext/1270477542/LED.o.d 
	@${RM} ${OBJECTDIR}/_ext/1270477542/LED.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1270477542/LED.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"../common" -I"." -MMD -MF "${OBJECTDIR}/_ext/1270477542/LED.o.d" -o ${OBJECTDIR}/_ext/1270477542/LED.o ../common/LED.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1270477542/pwm.o: ../common/pwm.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1270477542" 
	@${RM} ${OBJECTDIR}/_ext/1270477542/pwm.o.d 
	@${RM} ${OBJECTDIR}/_ext/1270477542/pwm.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1270477542/pwm.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"../common" -I"." -MMD -MF "${OBJECTDIR}/_ext/1270477542/pwm.o.d" -o ${OBJECTDIR}/_ext/1270477542/pwm.o ../common/pwm.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1270477542/RC_Servo.o: ../common/RC_Servo.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1270477542" 
	@${RM} ${OBJECTDIR}/_ext/1270477542/RC_Servo.o.d 
	@${RM} ${OBJECTDIR}/_ext/1270477542/RC_Servo.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1270477542/RC_Servo.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"../common" -I"." -MMD -MF "${OBJECTDIR}/_ext/1270477542/RC_Servo.o.d" -o ${OBJECTDIR}/_ext/1270477542/RC_Servo.o ../common/RC_Servo.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1270477542/roach.o: ../common/roach.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1270477542" 
	@${RM} ${OBJECTDIR}/_ext/1270477542/roach.o.d 
	@${RM} ${OBJECTDIR}/_ext/1270477542/roach.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1270477542/roach.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"../common" -I"." -MMD -MF "${OBJECTDIR}/_ext/1270477542/roach.o.d" -o ${OBJECTDIR}/_ext/1270477542/roach.o ../common/roach.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1270477542/robot.o: ../common/robot.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1270477542" 
	@${RM} ${OBJECTDIR}/_ext/1270477542/robot.o.d 
	@${RM} ${OBJECTDIR}/_ext/1270477542/robot.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1270477542/robot.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"../common" -I"." -MMD -MF "${OBJECTDIR}/_ext/1270477542/robot.o.d" -o ${OBJECTDIR}/_ext/1270477542/robot.o ../common/robot.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1270477542/serial.o: ../common/serial.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1270477542" 
	@${RM} ${OBJECTDIR}/_ext/1270477542/serial.o.d 
	@${RM} ${OBJECTDIR}/_ext/1270477542/serial.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1270477542/serial.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"../common" -I"." -MMD -MF "${OBJECTDIR}/_ext/1270477542/serial.o.d" -o ${OBJECTDIR}/_ext/1270477542/serial.o ../common/serial.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1270477542/timers.o: ../common/timers.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1270477542" 
	@${RM} ${OBJECTDIR}/_ext/1270477542/timers.o.d 
	@${RM} ${OBJECTDIR}/_ext/1270477542/timers.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1270477542/timers.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"../common" -I"." -MMD -MF "${OBJECTDIR}/_ext/1270477542/timers.o.d" -o ${OBJECTDIR}/_ext/1270477542/timers.o ../common/timers.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/TapeEventChecker.o: TapeEventChecker.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/TapeEventChecker.o.d 
	@${RM} ${OBJECTDIR}/TapeEventChecker.o 
	@${FIXDEPS} "${OBJECTDIR}/TapeEventChecker.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"../common" -I"." -MMD -MF "${OBJECTDIR}/TapeEventChecker.o.d" -o ${OBJECTDIR}/TapeEventChecker.o TapeEventChecker.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1270477542/pins.o: ../common/pins.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1270477542" 
	@${RM} ${OBJECTDIR}/_ext/1270477542/pins.o.d 
	@${RM} ${OBJECTDIR}/_ext/1270477542/pins.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1270477542/pins.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"../common" -I"." -MMD -MF "${OBJECTDIR}/_ext/1270477542/pins.o.d" -o ${OBJECTDIR}/_ext/1270477542/pins.o ../common/pins.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
else
${OBJECTDIR}/_ext/1270477542/AD.o: ../common/AD.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1270477542" 
	@${RM} ${OBJECTDIR}/_ext/1270477542/AD.o.d 
	@${RM} ${OBJECTDIR}/_ext/1270477542/AD.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1270477542/AD.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"../common" -I"." -MMD -MF "${OBJECTDIR}/_ext/1270477542/AD.o.d" -o ${OBJECTDIR}/_ext/1270477542/AD.o ../common/AD.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1270477542/BOARD.o: ../common/BOARD.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1270477542" 
	@${RM} ${OBJECTDIR}/_ext/1270477542/BOARD.o.d 
	@${RM} ${OBJECTDIR}/_ext/1270477542/BOARD.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1270477542/BOARD.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"../common" -I"." -MMD -MF "${OBJECTDIR}/_ext/1270477542/BOARD.o.d" -o ${OBJECTDIR}/_ext/1270477542/BOARD.o ../common/BOARD.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1270477542/ES_CheckEvents.o: ../common/ES_CheckEvents.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1270477542" 
	@${RM} ${OBJECTDIR}/_ext/1270477542/ES_CheckEvents.o.d 
	@${RM} ${OBJECTDIR}/_ext/1270477542/ES_CheckEvents.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1270477542/ES_CheckEvents.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"../common" -I"." -MMD -MF "${OBJECTDIR}/_ext/1270477542/ES_CheckEvents.o.d" -o ${OBJECTDIR}/_ext/1270477542/ES_CheckEvents.o ../common/ES_CheckEvents.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1270477542/ES_Framework.o: ../common/ES_Framework.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1270477542" 
	@${RM} ${OBJECTDIR}/_ext/1270477542/ES_Framework.o.d 
	@${RM} ${OBJECTDIR}/_ext/1270477542/ES_Framework.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1270477542/ES_Framework.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"../common" -I"." -MMD -MF "${OBJECTDIR}/_ext/1270477542/ES_Framework.o.d" -o ${OBJECTDIR}/_ext/1270477542/ES_Framework.o ../common/ES_Framework.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1270477542/ES_KeyboardInput.o: ../common/ES_KeyboardInput.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1270477542" 
	@${RM} ${OBJECTDIR}/_ext/1270477542/ES_KeyboardInput.o.d 
	@${RM} ${OBJECTDIR}/_ext/1270477542/ES_KeyboardInput.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1270477542/ES_KeyboardInput.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"../common" -I"." -MMD -MF "${OBJECTDIR}/_ext/1270477542/ES_KeyboardInput.o.d" -o ${OBJECTDIR}/_ext/1270477542/ES_KeyboardInput.o ../common/ES_KeyboardInput.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1270477542/ES_PostList.o: ../common/ES_PostList.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1270477542" 
	@${RM} ${OBJECTDIR}/_ext/1270477542/ES_PostList.o.d 
	@${RM} ${OBJECTDIR}/_ext/1270477542/ES_PostList.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1270477542/ES_PostList.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"../common" -I"." -MMD -MF "${OBJECTDIR}/_ext/1270477542/ES_PostList.o.d" -o ${OBJECTDIR}/_ext/1270477542/ES_PostList.o ../common/ES_PostList.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1270477542/ES_Queue.o: ../common/ES_Queue.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1270477542" 
	@${RM} ${OBJECTDIR}/_ext/1270477542/ES_Queue.o.d 
	@${RM} ${OBJECTDIR}/_ext/1270477542/ES_Queue.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1270477542/ES_Queue.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"../common" -I"." -MMD -MF "${OBJECTDIR}/_ext/1270477542/ES_Queue.o.d" -o ${OBJECTDIR}/_ext/1270477542/ES_Queue.o ../common/ES_Queue.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1270477542/ES_TattleTale.o: ../common/ES_TattleTale.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1270477542" 
	@${RM} ${OBJECTDIR}/_ext/1270477542/ES_TattleTale.o.d 
	@${RM} ${OBJECTDIR}/_ext/1270477542/ES_TattleTale.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1270477542/ES_TattleTale.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"../common" -I"." -MMD -MF "${OBJECTDIR}/_ext/1270477542/ES_TattleTale.o.d" -o ${OBJECTDIR}/_ext/1270477542/ES_TattleTale.o ../common/ES_TattleTale.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1270477542/ES_Timers.o: ../common/ES_Timers.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1270477542" 
	@${RM} ${OBJECTDIR}/_ext/1270477542/ES_Timers.o.d 
	@${RM} ${OBJECTDIR}/_ext/1270477542/ES_Timers.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1270477542/ES_Timers.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"../common" -I"." -MMD -MF "${OBJECTDIR}/_ext/1270477542/ES_Timers.o.d" -o ${OBJECTDIR}/_ext/1270477542/ES_Timers.o ../common/ES_Timers.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1270477542/IO_Ports.o: ../common/IO_Ports.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1270477542" 
	@${RM} ${OBJECTDIR}/_ext/1270477542/IO_Ports.o.d 
	@${RM} ${OBJECTDIR}/_ext/1270477542/IO_Ports.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1270477542/IO_Ports.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"../common" -I"." -MMD -MF "${OBJECTDIR}/_ext/1270477542/IO_Ports.o.d" -o ${OBJECTDIR}/_ext/1270477542/IO_Ports.o ../common/IO_Ports.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1270477542/LED.o: ../common/LED.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1270477542" 
	@${RM} ${OBJECTDIR}/_ext/1270477542/LED.o.d 
	@${RM} ${OBJECTDIR}/_ext/1270477542/LED.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1270477542/LED.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"../common" -I"." -MMD -MF "${OBJECTDIR}/_ext/1270477542/LED.o.d" -o ${OBJECTDIR}/_ext/1270477542/LED.o ../common/LED.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1270477542/pwm.o: ../common/pwm.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1270477542" 
	@${RM} ${OBJECTDIR}/_ext/1270477542/pwm.o.d 
	@${RM} ${OBJECTDIR}/_ext/1270477542/pwm.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1270477542/pwm.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"../common" -I"." -MMD -MF "${OBJECTDIR}/_ext/1270477542/pwm.o.d" -o ${OBJECTDIR}/_ext/1270477542/pwm.o ../common/pwm.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1270477542/RC_Servo.o: ../common/RC_Servo.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1270477542" 
	@${RM} ${OBJECTDIR}/_ext/1270477542/RC_Servo.o.d 
	@${RM} ${OBJECTDIR}/_ext/1270477542/RC_Servo.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1270477542/RC_Servo.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"../common" -I"." -MMD -MF "${OBJECTDIR}/_ext/1270477542/RC_Servo.o.d" -o ${OBJECTDIR}/_ext/1270477542/RC_Servo.o ../common/RC_Servo.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1270477542/roach.o: ../common/roach.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1270477542" 
	@${RM} ${OBJECTDIR}/_ext/1270477542/roach.o.d 
	@${RM} ${OBJECTDIR}/_ext/1270477542/roach.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1270477542/roach.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"../common" -I"." -MMD -MF "${OBJECTDIR}/_ext/1270477542/roach.o.d" -o ${OBJECTDIR}/_ext/1270477542/roach.o ../common/roach.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1270477542/robot.o: ../common/robot.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1270477542" 
	@${RM} ${OBJECTDIR}/_ext/1270477542/robot.o.d 
	@${RM} ${OBJECTDIR}/_ext/1270477542/robot.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1270477542/robot.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"../common" -I"." -MMD -MF "${OBJECTDIR}/_ext/1270477542/robot.o.d" -o ${OBJECTDIR}/_ext/1270477542/robot.o ../common/robot.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1270477542/serial.o: ../common/serial.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1270477542" 
	@${RM} ${OBJECTDIR}/_ext/1270477542/serial.o.d 
	@${RM} ${OBJECTDIR}/_ext/1270477542/serial.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1270477542/serial.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"../common" -I"." -MMD -MF "${OBJECTDIR}/_ext/1270477542/serial.o.d" -o ${OBJECTDIR}/_ext/1270477542/serial.o ../common/serial.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1270477542/timers.o: ../common/timers.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1270477542" 
	@${RM} ${OBJECTDIR}/_ext/1270477542/timers.o.d 
	@${RM} ${OBJECTDIR}/_ext/1270477542/timers.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1270477542/timers.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"../common" -I"." -MMD -MF "${OBJECTDIR}/_ext/1270477542/timers.o.d" -o ${OBJECTDIR}/_ext/1270477542/timers.o ../common/timers.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/TapeEventChecker.o: TapeEventChecker.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/TapeEventChecker.o.d 
	@${RM} ${OBJECTDIR}/TapeEventChecker.o 
	@${FIXDEPS} "${OBJECTDIR}/TapeEventChecker.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"../common" -I"." -MMD -MF "${OBJECTDIR}/TapeEventChecker.o.d" -o ${OBJECTDIR}/TapeEventChecker.o TapeEventChecker.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1270477542/pins.o: ../common/pins.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1270477542" 
	@${RM} ${OBJECTDIR}/_ext/1270477542/pins.o.d 
	@${RM} ${OBJECTDIR}/_ext/1270477542/pins.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1270477542/pins.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"../common" -I"." -MMD -MF "${OBJECTDIR}/_ext/1270477542/pins.o.d" -o ${OBJECTDIR}/_ext/1270477542/pins.o ../common/pins.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compileCPP
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/TapeEventChecker.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    ../common/bootloader320.ld
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -g -mdebugger -D__MPLAB_DEBUGGER_PK3=1 -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/TapeEventChecker.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)   -mreserve=data@0x0:0x1FC -mreserve=boot@0x1FC02000:0x1FC02FEF -mreserve=boot@0x1FC02000:0x1FC024FF  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D=__DEBUG_D,--defsym=__MPLAB_DEBUGGER_PK3=1,--defsym=_min_heap_size=1024,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/TapeEventChecker.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   ../common/bootloader320.ld
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/TapeEventChecker.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=_min_heap_size=1024,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml
	${MP_CC_DIR}/xc32-bin2hex dist/${CND_CONF}/${IMAGE_TYPE}/TapeEventChecker.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} 
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/default
	${RM} -r dist/default

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell "${PATH_TO_IDE_BIN}"mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
