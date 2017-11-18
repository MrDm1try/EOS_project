#!/bin/bash
set -eu

help () {
    echo ""
    echo "USAGE: set_lid.sh VALUE"
    echo ""
    echo "VALUE: percentage, should be in range 0..100"
    echo ""
}

DUTY_CYCLE_LID="/sys/class/pwm/pwmchip0/pwm0/duty_cycle"
OPEN=1150000
CLOSED=1800000

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
    lid_value=$((${CLOSED} - $(($(($((${CLOSED} - ${OPEN})) / 100)) * $1))))
    echo ${lid_value} > ${DUTY_CYCLE_LID}
else
    help
    exit 1
fi
exit 0
