#!/bin/bash

set_options()
{
    sleep 60

    /sbin/iw dev wlan0 set power_save on
    /usr/sbin/powertop --auto-tune
    /sbin/ethtool -s eth0 wol d
}

set_options &
