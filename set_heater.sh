#!/bin/bash
set -eu

help () {
    echo ""
    echo "USAGE: set_heater.sh OPTION"
    echo ""
    echo "OPTION:"
    echo "    0     turn off the heater"
    echo "    1     turn on the heater"
    echo ""
}

GPIO_VALUE="/sys/class/gpio/gpio60/value"

if [ $# -eq 0 ];
then
	help
	exit 0
fi

if [ $1 -eq 0 ];
then
	echo 0 > ${GPIO_VALUE}
elif [ $1 -eq 1 ];
then
	echo 1 > ${GPIO_VALUE}
else
	help
	exit 1
fi

exit 0
