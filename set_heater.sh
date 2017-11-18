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

GPIO_DIRECTION="/sys/class/gpio/gpio60/direction"

if [ $# -eq 0 ];
then
	help
	exit 0
fi

if [ $1 -eq 0 ];
then
	echo low > ${GPIO_DIRECTION}
elif [ $1 -eq 1 ];
then
	echo high > ${GPIO_DIRECTION}
else
	help
	exit 1
fi

exit 0
