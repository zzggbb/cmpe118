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
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/HSM.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/HSM.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
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
SOURCEFILES_QUOTED_IF_SPACED=../common/ES_CheckEvents.c ../common/ES_Framework.c ../common/ES_KeyboardInput.c ../common/ES_PostList.c ../common/ES_Queue.c ../common/ES_TattleTale.c ../common/ES_Timers.c ../common/timers.c ../common/serial.c ../common/pwm.c ../common/pins.c ../common/LED.c ../common/IO_Ports.c ../common/AD.c ../common/BOARD.c Attack.c BeaconAlign.c BeaconEventChecker.c BumpEventChecker.c FindIFZ.c ../common/RC_Servo.c hsm_main.c main.c ../common/robot.c Rotate90.c TapeEventChecker.c EdgeAlign.c EdgeFollower.c HSM.c ShootN.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/1270477542/ES_CheckEvents.o ${OBJECTDIR}/_ext/1270477542/ES_Framework.o ${OBJECTDIR}/_ext/1270477542/ES_KeyboardInput.o ${OBJECTDIR}/_ext/1270477542/ES_PostList.o ${OBJECTDIR}/_ext/1270477542/ES_Queue.o ${OBJECTDIR}/_ext/1270477542/ES_TattleTale.o ${OBJECTDIR}/_ext/1270477542/ES_Timers.o ${OBJECTDIR}/_ext/1270477542/timers.o ${OBJECTDIR}/_ext/1270477542/serial.o ${OBJECTDIR}/_ext/1270477542/pwm.o ${OBJECTDIR}/_ext/1270477542/pins.o ${OBJECTDIR}/_ext/1270477542/LED.o ${OBJECTDIR}/_ext/1270477542/IO_Ports.o ${OBJECTDIR}/_ext/1270477542/AD.o ${OBJECTDIR}/_ext/1270477542/BOARD.o ${OBJECTDIR}/Attack.o ${OBJECTDIR}/BeaconAlign.o ${OBJECTDIR}/BeaconEventChecker.o ${OBJECTDIR}/BumpEventChecker.o ${OBJECTDIR}/FindIFZ.o ${OBJECTDIR}/_ext/1270477542/RC_Servo.o ${OBJECTDIR}/hsm_main.o ${OBJECTDIR}/main.o ${OBJECTDIR}/_ext/1270477542/robot.o ${OBJECTDIR}/Rotate90.o ${OBJECTDIR}/TapeEventChecker.o ${OBJECTDIR}/EdgeAlign.o ${OBJECTDIR}/EdgeFollower.o ${OBJECTDIR}/HSM.o ${OBJECTDIR}/ShootN.o
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/1270477542/ES_CheckEvents.o.d ${OBJECTDIR}/_ext/1270477542/ES_Framework.o.d ${OBJECTDIR}/_ext/1270477542/ES_KeyboardInput.o.d ${OBJECTDIR}/_ext/1270477542/ES_PostList.o.d ${OBJECTDIR}/_ext/1270477542/ES_Queue.o.d ${OBJECTDIR}/_ext/1270477542/ES_TattleTale.o.d ${OBJECTDIR}/_ext/1270477542/ES_Timers.o.d ${OBJECTDIR}/_ext/1270477542/timers.o.d ${OBJECTDIR}/_ext/1270477542/serial.o.d ${OBJECTDIR}/_ext/1270477542/pwm.o.d ${OBJECTDIR}/_ext/1270477542/pins.o.d ${OBJECTDIR}/_ext/1270477542/LED.o.d ${OBJECTDIR}/_ext/1270477542/IO_Ports.o.d ${OBJECTDIR}/_ext/1270477542/AD.o.d ${OBJECTDIR}/_ext/1270477542/BOARD.o.d ${OBJECTDIR}/Attack.o.d ${OBJECTDIR}/BeaconAlign.o.d ${OBJECTDIR}/BeaconEventChecker.o.d ${OBJECTDIR}/BumpEventChecker.o.d ${OBJECTDIR}/FindIFZ.o.d ${OBJECTDIR}/_ext/1270477542/RC_Servo.o.d ${OBJECTDIR}/hsm_main.o.d ${OBJECTDIR}/main.o.d ${OBJECTDIR}/_ext/1270477542/robot.o.d ${OBJECTDIR}/Rotate90.o.d ${OBJECTDIR}/TapeEventChecker.o.d ${OBJECTDIR}/EdgeAlign.o.d ${OBJECTDIR}/EdgeFollower.o.d ${OBJECTDIR}/HSM.o.d ${OBJECTDIR}/ShootN.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/1270477542/ES_CheckEvents.o ${OBJECTDIR}/_ext/1270477542/ES_Framework.o ${OBJECTDIR}/_ext/1270477542/ES_KeyboardInput.o ${OBJECTDIR}/_ext/1270477542/ES_PostList.o ${OBJECTDIR}/_ext/1270477542/ES_Queue.o ${OBJECTDIR}/_ext/1270477542/ES_TattleTale.o ${OBJECTDIR}/_ext/1270477542/ES_Timers.o ${OBJECTDIR}/_ext/1270477542/timers.o ${OBJECTDIR}/_ext/1270477542/serial.o ${OBJECTDIR}/_ext/1270477542/pwm.o ${OBJECTDIR}/_ext/1270477542/pins.o ${OBJECTDIR}/_ext/1270477542/LED.o ${OBJECTDIR}/_ext/1270477542/IO_Ports.o ${OBJECTDIR}/_ext/1270477542/AD.o ${OBJECTDIR}/_ext/1270477542/BOARD.o ${OBJECTDIR}/Attack.o ${OBJECTDIR}/BeaconAlign.o ${OBJECTDIR}/BeaconEventChecker.o ${OBJECTDIR}/BumpEventChecker.o ${OBJECTDIR}/FindIFZ.o ${OBJECTDIR}/_ext/1270477542/RC_Servo.o ${OBJECTDIR}/hsm_main.o ${OBJECTDIR}/main.o ${OBJECTDIR}/_ext/1270477542/robot.o ${OBJECTDIR}/Rotate90.o ${OBJECTDIR}/TapeEventChecker.o ${OBJECTDIR}/EdgeAlign.o ${OBJECTDIR}/EdgeFollower.o ${OBJECTDIR}/HSM.o ${OBJECTDIR}/ShootN.o

# Source Files
SOURCEFILES=../common/ES_CheckEvents.c ../common/ES_Framework.c ../common/ES_KeyboardInput.c ../common/ES_PostList.c ../common/ES_Queue.c ../common/ES_TattleTale.c ../common/ES_Timers.c ../common/timers.c ../common/serial.c ../common/pwm.c ../common/pins.c ../common/LED.c ../common/IO_Ports.c ../common/AD.c ../common/BOARD.c Attack.c BeaconAlign.c BeaconEventChecker.c BumpEventChecker.c FindIFZ.c ../common/RC_Servo.c hsm_main.c main.c ../common/robot.c Rotate90.c TapeEventChecker.c EdgeAlign.c EdgeFollower.c HSM.c ShootN.c


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
	${MAKE}  -f nbproject/Makefile-default.mk dist/${CND_CONF}/${IMAGE_TYPE}/HSM.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

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
	
${OBJECTDIR}/_ext/1270477542/timers.o: ../common/timers.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1270477542" 
	@${RM} ${OBJECTDIR}/_ext/1270477542/timers.o.d 
	@${RM} ${OBJECTDIR}/_ext/1270477542/timers.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1270477542/timers.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"../common" -I"." -MMD -MF "${OBJECTDIR}/_ext/1270477542/timers.o.d" -o ${OBJECTDIR}/_ext/1270477542/timers.o ../common/timers.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1270477542/serial.o: ../common/serial.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1270477542" 
	@${RM} ${OBJECTDIR}/_ext/1270477542/serial.o.d 
	@${RM} ${OBJECTDIR}/_ext/1270477542/serial.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1270477542/serial.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"../common" -I"." -MMD -MF "${OBJECTDIR}/_ext/1270477542/serial.o.d" -o ${OBJECTDIR}/_ext/1270477542/serial.o ../common/serial.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1270477542/pwm.o: ../common/pwm.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1270477542" 
	@${RM} ${OBJECTDIR}/_ext/1270477542/pwm.o.d 
	@${RM} ${OBJECTDIR}/_ext/1270477542/pwm.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1270477542/pwm.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"../common" -I"." -MMD -MF "${OBJECTDIR}/_ext/1270477542/pwm.o.d" -o ${OBJECTDIR}/_ext/1270477542/pwm.o ../common/pwm.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1270477542/pins.o: ../common/pins.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1270477542" 
	@${RM} ${OBJECTDIR}/_ext/1270477542/pins.o.d 
	@${RM} ${OBJECTDIR}/_ext/1270477542/pins.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1270477542/pins.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"../common" -I"." -MMD -MF "${OBJECTDIR}/_ext/1270477542/pins.o.d" -o ${OBJECTDIR}/_ext/1270477542/pins.o ../common/pins.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1270477542/LED.o: ../common/LED.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1270477542" 
	@${RM} ${OBJECTDIR}/_ext/1270477542/LED.o.d 
	@${RM} ${OBJECTDIR}/_ext/1270477542/LED.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1270477542/LED.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"../common" -I"." -MMD -MF "${OBJECTDIR}/_ext/1270477542/LED.o.d" -o ${OBJECTDIR}/_ext/1270477542/LED.o ../common/LED.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1270477542/IO_Ports.o: ../common/IO_Ports.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1270477542" 
	@${RM} ${OBJECTDIR}/_ext/1270477542/IO_Ports.o.d 
	@${RM} ${OBJECTDIR}/_ext/1270477542/IO_Ports.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1270477542/IO_Ports.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"../common" -I"." -MMD -MF "${OBJECTDIR}/_ext/1270477542/IO_Ports.o.d" -o ${OBJECTDIR}/_ext/1270477542/IO_Ports.o ../common/IO_Ports.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
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
	
${OBJECTDIR}/Attack.o: Attack.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Attack.o.d 
	@${RM} ${OBJECTDIR}/Attack.o 
	@${FIXDEPS} "${OBJECTDIR}/Attack.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"../common" -I"." -MMD -MF "${OBJECTDIR}/Attack.o.d" -o ${OBJECTDIR}/Attack.o Attack.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/BeaconAlign.o: BeaconAlign.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/BeaconAlign.o.d 
	@${RM} ${OBJECTDIR}/BeaconAlign.o 
	@${FIXDEPS} "${OBJECTDIR}/BeaconAlign.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"../common" -I"." -MMD -MF "${OBJECTDIR}/BeaconAlign.o.d" -o ${OBJECTDIR}/BeaconAlign.o BeaconAlign.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/BeaconEventChecker.o: BeaconEventChecker.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/BeaconEventChecker.o.d 
	@${RM} ${OBJECTDIR}/BeaconEventChecker.o 
	@${FIXDEPS} "${OBJECTDIR}/BeaconEventChecker.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"../common" -I"." -MMD -MF "${OBJECTDIR}/BeaconEventChecker.o.d" -o ${OBJECTDIR}/BeaconEventChecker.o BeaconEventChecker.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/BumpEventChecker.o: BumpEventChecker.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/BumpEventChecker.o.d 
	@${RM} ${OBJECTDIR}/BumpEventChecker.o 
	@${FIXDEPS} "${OBJECTDIR}/BumpEventChecker.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"../common" -I"." -MMD -MF "${OBJECTDIR}/BumpEventChecker.o.d" -o ${OBJECTDIR}/BumpEventChecker.o BumpEventChecker.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/FindIFZ.o: FindIFZ.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/FindIFZ.o.d 
	@${RM} ${OBJECTDIR}/FindIFZ.o 
	@${FIXDEPS} "${OBJECTDIR}/FindIFZ.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"../common" -I"." -MMD -MF "${OBJECTDIR}/FindIFZ.o.d" -o ${OBJECTDIR}/FindIFZ.o FindIFZ.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1270477542/RC_Servo.o: ../common/RC_Servo.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1270477542" 
	@${RM} ${OBJECTDIR}/_ext/1270477542/RC_Servo.o.d 
	@${RM} ${OBJECTDIR}/_ext/1270477542/RC_Servo.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1270477542/RC_Servo.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"../common" -I"." -MMD -MF "${OBJECTDIR}/_ext/1270477542/RC_Servo.o.d" -o ${OBJECTDIR}/_ext/1270477542/RC_Servo.o ../common/RC_Servo.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/hsm_main.o: hsm_main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/hsm_main.o.d 
	@${RM} ${OBJECTDIR}/hsm_main.o 
	@${FIXDEPS} "${OBJECTDIR}/hsm_main.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"../common" -I"." -MMD -MF "${OBJECTDIR}/hsm_main.o.d" -o ${OBJECTDIR}/hsm_main.o hsm_main.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/main.o: main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	@${FIXDEPS} "${OBJECTDIR}/main.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"../common" -I"." -MMD -MF "${OBJECTDIR}/main.o.d" -o ${OBJECTDIR}/main.o main.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1270477542/robot.o: ../common/robot.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1270477542" 
	@${RM} ${OBJECTDIR}/_ext/1270477542/robot.o.d 
	@${RM} ${OBJECTDIR}/_ext/1270477542/robot.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1270477542/robot.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"../common" -I"." -MMD -MF "${OBJECTDIR}/_ext/1270477542/robot.o.d" -o ${OBJECTDIR}/_ext/1270477542/robot.o ../common/robot.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/Rotate90.o: Rotate90.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Rotate90.o.d 
	@${RM} ${OBJECTDIR}/Rotate90.o 
	@${FIXDEPS} "${OBJECTDIR}/Rotate90.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"../common" -I"." -MMD -MF "${OBJECTDIR}/Rotate90.o.d" -o ${OBJECTDIR}/Rotate90.o Rotate90.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/TapeEventChecker.o: TapeEventChecker.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/TapeEventChecker.o.d 
	@${RM} ${OBJECTDIR}/TapeEventChecker.o 
	@${FIXDEPS} "${OBJECTDIR}/TapeEventChecker.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"../common" -I"." -MMD -MF "${OBJECTDIR}/TapeEventChecker.o.d" -o ${OBJECTDIR}/TapeEventChecker.o TapeEventChecker.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/EdgeAlign.o: EdgeAlign.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/EdgeAlign.o.d 
	@${RM} ${OBJECTDIR}/EdgeAlign.o 
	@${FIXDEPS} "${OBJECTDIR}/EdgeAlign.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"../common" -I"." -MMD -MF "${OBJECTDIR}/EdgeAlign.o.d" -o ${OBJECTDIR}/EdgeAlign.o EdgeAlign.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/EdgeFollower.o: EdgeFollower.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/EdgeFollower.o.d 
	@${RM} ${OBJECTDIR}/EdgeFollower.o 
	@${FIXDEPS} "${OBJECTDIR}/EdgeFollower.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"../common" -I"." -MMD -MF "${OBJECTDIR}/EdgeFollower.o.d" -o ${OBJECTDIR}/EdgeFollower.o EdgeFollower.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/HSM.o: HSM.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/HSM.o.d 
	@${RM} ${OBJECTDIR}/HSM.o 
	@${FIXDEPS} "${OBJECTDIR}/HSM.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"../common" -I"." -MMD -MF "${OBJECTDIR}/HSM.o.d" -o ${OBJECTDIR}/HSM.o HSM.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/ShootN.o: ShootN.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/ShootN.o.d 
	@${RM} ${OBJECTDIR}/ShootN.o 
	@${FIXDEPS} "${OBJECTDIR}/ShootN.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"../common" -I"." -MMD -MF "${OBJECTDIR}/ShootN.o.d" -o ${OBJECTDIR}/ShootN.o ShootN.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
else
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
	
${OBJECTDIR}/_ext/1270477542/timers.o: ../common/timers.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1270477542" 
	@${RM} ${OBJECTDIR}/_ext/1270477542/timers.o.d 
	@${RM} ${OBJECTDIR}/_ext/1270477542/timers.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1270477542/timers.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"../common" -I"." -MMD -MF "${OBJECTDIR}/_ext/1270477542/timers.o.d" -o ${OBJECTDIR}/_ext/1270477542/timers.o ../common/timers.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1270477542/serial.o: ../common/serial.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1270477542" 
	@${RM} ${OBJECTDIR}/_ext/1270477542/serial.o.d 
	@${RM} ${OBJECTDIR}/_ext/1270477542/serial.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1270477542/serial.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"../common" -I"." -MMD -MF "${OBJECTDIR}/_ext/1270477542/serial.o.d" -o ${OBJECTDIR}/_ext/1270477542/serial.o ../common/serial.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1270477542/pwm.o: ../common/pwm.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1270477542" 
	@${RM} ${OBJECTDIR}/_ext/1270477542/pwm.o.d 
	@${RM} ${OBJECTDIR}/_ext/1270477542/pwm.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1270477542/pwm.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"../common" -I"." -MMD -MF "${OBJECTDIR}/_ext/1270477542/pwm.o.d" -o ${OBJECTDIR}/_ext/1270477542/pwm.o ../common/pwm.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1270477542/pins.o: ../common/pins.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1270477542" 
	@${RM} ${OBJECTDIR}/_ext/1270477542/pins.o.d 
	@${RM} ${OBJECTDIR}/_ext/1270477542/pins.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1270477542/pins.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"../common" -I"." -MMD -MF "${OBJECTDIR}/_ext/1270477542/pins.o.d" -o ${OBJECTDIR}/_ext/1270477542/pins.o ../common/pins.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1270477542/LED.o: ../common/LED.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1270477542" 
	@${RM} ${OBJECTDIR}/_ext/1270477542/LED.o.d 
	@${RM} ${OBJECTDIR}/_ext/1270477542/LED.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1270477542/LED.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"../common" -I"." -MMD -MF "${OBJECTDIR}/_ext/1270477542/LED.o.d" -o ${OBJECTDIR}/_ext/1270477542/LED.o ../common/LED.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1270477542/IO_Ports.o: ../common/IO_Ports.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1270477542" 
	@${RM} ${OBJECTDIR}/_ext/1270477542/IO_Ports.o.d 
	@${RM} ${OBJECTDIR}/_ext/1270477542/IO_Ports.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1270477542/IO_Ports.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"../common" -I"." -MMD -MF "${OBJECTDIR}/_ext/1270477542/IO_Ports.o.d" -o ${OBJECTDIR}/_ext/1270477542/IO_Ports.o ../common/IO_Ports.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
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
	
${OBJECTDIR}/Attack.o: Attack.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Attack.o.d 
	@${RM} ${OBJECTDIR}/Attack.o 
	@${FIXDEPS} "${OBJECTDIR}/Attack.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"../common" -I"." -MMD -MF "${OBJECTDIR}/Attack.o.d" -o ${OBJECTDIR}/Attack.o Attack.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/BeaconAlign.o: BeaconAlign.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/BeaconAlign.o.d 
	@${RM} ${OBJECTDIR}/BeaconAlign.o 
	@${FIXDEPS} "${OBJECTDIR}/BeaconAlign.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"../common" -I"." -MMD -MF "${OBJECTDIR}/BeaconAlign.o.d" -o ${OBJECTDIR}/BeaconAlign.o BeaconAlign.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/BeaconEventChecker.o: BeaconEventChecker.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/BeaconEventChecker.o.d 
	@${RM} ${OBJECTDIR}/BeaconEventChecker.o 
	@${FIXDEPS} "${OBJECTDIR}/BeaconEventChecker.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"../common" -I"." -MMD -MF "${OBJECTDIR}/BeaconEventChecker.o.d" -o ${OBJECTDIR}/BeaconEventChecker.o BeaconEventChecker.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/BumpEventChecker.o: BumpEventChecker.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/BumpEventChecker.o.d 
	@${RM} ${OBJECTDIR}/BumpEventChecker.o 
	@${FIXDEPS} "${OBJECTDIR}/BumpEventChecker.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"../common" -I"." -MMD -MF "${OBJECTDIR}/BumpEventChecker.o.d" -o ${OBJECTDIR}/BumpEventChecker.o BumpEventChecker.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/FindIFZ.o: FindIFZ.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/FindIFZ.o.d 
	@${RM} ${OBJECTDIR}/FindIFZ.o 
	@${FIXDEPS} "${OBJECTDIR}/FindIFZ.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"../common" -I"." -MMD -MF "${OBJECTDIR}/FindIFZ.o.d" -o ${OBJECTDIR}/FindIFZ.o FindIFZ.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1270477542/RC_Servo.o: ../common/RC_Servo.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1270477542" 
	@${RM} ${OBJECTDIR}/_ext/1270477542/RC_Servo.o.d 
	@${RM} ${OBJECTDIR}/_ext/1270477542/RC_Servo.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1270477542/RC_Servo.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"../common" -I"." -MMD -MF "${OBJECTDIR}/_ext/1270477542/RC_Servo.o.d" -o ${OBJECTDIR}/_ext/1270477542/RC_Servo.o ../common/RC_Servo.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/hsm_main.o: hsm_main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/hsm_main.o.d 
	@${RM} ${OBJECTDIR}/hsm_main.o 
	@${FIXDEPS} "${OBJECTDIR}/hsm_main.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"../common" -I"." -MMD -MF "${OBJECTDIR}/hsm_main.o.d" -o ${OBJECTDIR}/hsm_main.o hsm_main.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/main.o: main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	@${FIXDEPS} "${OBJECTDIR}/main.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"../common" -I"." -MMD -MF "${OBJECTDIR}/main.o.d" -o ${OBJECTDIR}/main.o main.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1270477542/robot.o: ../common/robot.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1270477542" 
	@${RM} ${OBJECTDIR}/_ext/1270477542/robot.o.d 
	@${RM} ${OBJECTDIR}/_ext/1270477542/robot.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1270477542/robot.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"../common" -I"." -MMD -MF "${OBJECTDIR}/_ext/1270477542/robot.o.d" -o ${OBJECTDIR}/_ext/1270477542/robot.o ../common/robot.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/Rotate90.o: Rotate90.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Rotate90.o.d 
	@${RM} ${OBJECTDIR}/Rotate90.o 
	@${FIXDEPS} "${OBJECTDIR}/Rotate90.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"../common" -I"." -MMD -MF "${OBJECTDIR}/Rotate90.o.d" -o ${OBJECTDIR}/Rotate90.o Rotate90.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/TapeEventChecker.o: TapeEventChecker.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/TapeEventChecker.o.d 
	@${RM} ${OBJECTDIR}/TapeEventChecker.o 
	@${FIXDEPS} "${OBJECTDIR}/TapeEventChecker.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"../common" -I"." -MMD -MF "${OBJECTDIR}/TapeEventChecker.o.d" -o ${OBJECTDIR}/TapeEventChecker.o TapeEventChecker.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/EdgeAlign.o: EdgeAlign.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/EdgeAlign.o.d 
	@${RM} ${OBJECTDIR}/EdgeAlign.o 
	@${FIXDEPS} "${OBJECTDIR}/EdgeAlign.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"../common" -I"." -MMD -MF "${OBJECTDIR}/EdgeAlign.o.d" -o ${OBJECTDIR}/EdgeAlign.o EdgeAlign.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/EdgeFollower.o: EdgeFollower.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/EdgeFollower.o.d 
	@${RM} ${OBJECTDIR}/EdgeFollower.o 
	@${FIXDEPS} "${OBJECTDIR}/EdgeFollower.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"../common" -I"." -MMD -MF "${OBJECTDIR}/EdgeFollower.o.d" -o ${OBJECTDIR}/EdgeFollower.o EdgeFollower.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/HSM.o: HSM.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/HSM.o.d 
	@${RM} ${OBJECTDIR}/HSM.o 
	@${FIXDEPS} "${OBJECTDIR}/HSM.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"../common" -I"." -MMD -MF "${OBJECTDIR}/HSM.o.d" -o ${OBJECTDIR}/HSM.o HSM.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/ShootN.o: ShootN.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/ShootN.o.d 
	@${RM} ${OBJECTDIR}/ShootN.o 
	@${FIXDEPS} "${OBJECTDIR}/ShootN.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"../common" -I"." -MMD -MF "${OBJECTDIR}/ShootN.o.d" -o ${OBJECTDIR}/ShootN.o ShootN.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD) 
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compileCPP
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/HSM.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    ../common/bootloader320.ld
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -g -mdebugger -D__MPLAB_DEBUGGER_PK3=1 -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/HSM.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)   -mreserve=data@0x0:0x1FC -mreserve=boot@0x1FC02000:0x1FC02FEF -mreserve=boot@0x1FC02000:0x1FC024FF  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D=__DEBUG_D,--defsym=__MPLAB_DEBUGGER_PK3=1,--defsym=_min_heap_size=1024,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/HSM.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   ../common/bootloader320.ld
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/HSM.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=_min_heap_size=1024,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml
	${MP_CC_DIR}/xc32-bin2hex dist/${CND_CONF}/${IMAGE_TYPE}/HSM.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} 
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
