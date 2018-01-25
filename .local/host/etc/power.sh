#!/bin/bash

set_options()
{
    sleep 60

    /usr/sbin/powertop --auto-tune
    #/sbin/ethtool -s eth0 wol d
    sleep 2
    /sbin/iw dev wlan0 set power_save off
}

set_options &
