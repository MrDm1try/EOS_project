#!/bin/bash
set -eu

help () {
    echo ""
    echo "USAGE: get_led.sh"
    echo ""
    echo "OUTPUT: percentage, should be in range 0..100"
    echo ""
}

DUTY_CYCLE_LED="/sys/class/pwm/pwmchip2/pwm0/duty_cycle"
ON=5000000
OFF=0

duty_cycle=$(cat ${DUTY_CYCLE_LED})
led_value=$(( $(( $((${duty_cycle} - ${OFF})) * 100)) /  $((${ON} - ${OFF}))))
echo ${led_value}

exit 0
