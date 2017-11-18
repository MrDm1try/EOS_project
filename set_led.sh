#!/bin/bash
set -eu

help () {
    echo ""
    echo "USAGE: set_lid.sh INTENSITY"
    echo ""
    echo "INTENSITY: percentage, should be in range 0..100"
    echo ""
}

DUTY_CYCLE_LED="/sys/class/pwm/pwmchip2/pwm0/duty_cycle"
ON=5000000
OFF=0

if [ $# -eq 0 ];
then
	help
	exit 0
fi

case ${1} in 
    ''|*[!0-9]*) 
        help
        exit 1;;
esac

if ((0<= ${1} && ${1}<=100))
then
    led_value=$(($(($(($((${ON} - ${OFF})) / 100)) * $1)) + ${OFF}))
    echo ${led_value} > ${DUTY_CYCLE_LED}
else
    help
    exit 1
fi

exit 0
