#!/bin/bash
doctl compute droplet rm -f -v $(doctl compute droplet ls | awk '{print $1 " " $2}' | grep darren | awk '{print $1}')
