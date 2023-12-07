#!/bin/bash

sudo rmmod iwlmvm iwlwifi mac80211 cfg80211
sudo systemctl restart NetworkManager
sudo modprobe iwlmvm iwlwifi

