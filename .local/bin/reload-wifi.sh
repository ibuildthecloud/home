#!/bin/bash

sudo rmmod iwlmvm iwlwifi
sudo killall -9 /sbin/wpa_supplicant
sleep 1
sudo modprobe iwlmvm iwlwifi
