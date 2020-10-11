#!/bin/bash
while ! kubectl apply -f https://raw.githubusercontent.com/ibuildthecloud/fleet-kitchensink/register/register.yaml; do
    sleep 1
done
