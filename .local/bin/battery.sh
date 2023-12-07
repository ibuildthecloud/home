#!/bin/bash

for i in /sys/devices/system/cpu/cpu*/cpufreq/energy_performance_preference; do
    echo power > $i
done
