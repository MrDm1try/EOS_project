#!/bin/bash
set -eu

help () {
    echo ""
    echo "USAGE: get_lid.sh"
    echo ""
    echo "OUTPUT: percentage, to which lid is open, in range 0..100"
    echo ""
}

PWM_LID="/sys/class/pwm/pwmchip0"
DUTY_CYCLE_LID="${PWM_LID}/pwm0/duty_cycle"
OPEN=1150000
CLOSED=1800000

duty_cycle=$(cat ${DUTY_CYCLE_LID})
lid_value=$(( $(( $((${CLOSED} - ${duty_cycle})) * 100)) /  $((${CLOSED} - ${OPEN}))))
echo ${lid_value}

exit 0
