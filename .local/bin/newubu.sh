#!/bin/bash
set -x

MEM=${MEM:-8}
KEY=$(doctl compute ssh-key list | grep -i darren@rancher.com | awk '{print $1}')
ID=$(doctl compute droplet create --image ubuntu-20-04-x64 --size ${MEM}gb --region sfo2 --ssh-keys 497506 --format ID --no-header darren-${RANDOM})

while true; do
    IP=$(doctl compute droplet get --no-header --format PublicIPv4 $ID)
    if [ -z "$IP" ]; then
        echo "Waiting for IP"
        sleep 1
        continue
    fi

    if ! ping -c 1 $IP; then
        echo "Waiting on networking"
        sleep 2
        continue
    fi

    if ! ssh-insecure.sh -l root $IP true; then
        echo Waiting for SSH
        sleep 2
        continue
    fi

    exec ssh-insecure.sh -l root $IP
done