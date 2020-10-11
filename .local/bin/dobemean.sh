#!/bin/bash
doctl compute droplet rm -f -v $(doctl compute droplet ls | grep -v DoNotDelete | awk '{print $1}' | grep -vw ID)
