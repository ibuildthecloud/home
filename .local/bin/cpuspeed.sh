#!/bin/bash

echo "##### MHZ #####"
grep -i mhz /proc/cpuinfo
echo
echo "##### SYS #####"
(
    for i in /sys/devices/system/cpu/cpu0/cpufreq/*; do
        echo $i $(<$i)
    done
) | column -t
