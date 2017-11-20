#!/bin/bash
set -eu

help () {
    echo ""
    echo "USAGE: get_heater.sh"
    echo ""
    echo "OUTPUT:"
    echo "    0 if heater is off, 1 if heater if on"
    echo ""
}

GPIO_VALUE="/sys/class/gpio/gpio60/value"

cat ${GPIO_VALUE}

exit 0
