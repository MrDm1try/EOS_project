#!/bin/bash
set -eu

SLOTS="/sys/devices/platform/bone_capemgr/slots"

PWM_LED="/sys/class/pwm/pwmchip2"
PWM_LID="/sys/class/pwm/pwmchip0"

PWM_EXPORT_LED="${PWM_LED}/export"
PWM_EXPORT_LID="${PWM_LID}/export"

PERIOD_LED="${PWM_LED}/pwm0/period"
PERIOD_LID="${PWM_LID}/pwm0/period"
DUTY_CYCLE_LED="${PWM_LED}/pwm0/duty_cycle"
DUTY_CYCLE_LID="${PWM_LID}/pwm0/duty_cycle"
ENABLE_LED="${PWM_LED}/pwm0/enable"
ENABLE_LID="${PWM_LID}/pwm0/enable"
 
GPIO_EXPORT="/sys/class/gpio/export"
GPIO_PIN=60
GPIO_DIRECTION="/sys/class/gpio/gpio60/direction"

echo BB-ADC > ${SLOTS}
echo cape-universaln > ${SLOTS}
config-pin -a P9_14 pwm
config-pin -a P9_22 pwm

echo 0 > ${PWM_EXPORT_LED}
echo 0 > ${PWM_EXPORT_LID}

echo 5000000 > ${PERIOD_LED}
echo 20000000 > ${PERIOD_LID}
echo 0 > ${DUTY_CYCLE_LED}
echo 1800000 > ${DUTY_CYCLE_LID}
echo 1 > ${ENABLE_LED}
echo 1 > ${ENABLE_LID}
sleep 1
echo 0 > ${ENABLE_LID}

echo ${GPIO_PIN} > ${GPIO_EXPORT}
echo out > ${GPIO_DIRECTION}

exit 0
