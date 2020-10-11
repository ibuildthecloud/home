#!/bin/bash
doctl compute ssh-key list | grep -v @ | awk '{print $1}' | xargs -I{} doctl compute ssh-key delete -f {}
