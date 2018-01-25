#!/bin/bash

sudo rmmod iwlmvm iwlwifi mac80211 cfg80211 rtl_usb rtlwifi rtl8192cu mac80211 rtlwifi rtl8192c_common

sudo stop network-manager
sudo killall -9 /sbin/wpa_supplicant
sudo killall -9 dhclient
sleep 1
sudo modprobe iwlmvm iwlwifi
sleep 1
sudo /sbin/iw dev wlan0 set power_save off
#sudo start network-manager
