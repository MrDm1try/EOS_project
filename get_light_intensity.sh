#!/bin/bash

LIGHT_DATA_PATH="/sys/bus/iio/devices/iio:device0/in_voltage0_raw"

MAX=3600
MIN=0

light_data=$(cat ${LIGHT_DATA_PATH})
light_percentage=$(($(($((${light_data}-${MIN}))*100))/$((${MAX}-${MIN}))))
echo ${light_percentage}
exit 0
