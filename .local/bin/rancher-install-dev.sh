#!/bin/bash
set -x -e
cd ~/src/rancher/build/chart/rancher
helm -n cattle-system \
    upgrade \
    --install \
    --create-namespace \
    --set rancherImage=ibuildthecloud/rancher \
    --set rancherImageTag=dev \
    --set replicas=1 \
    --set controllerReplicas=1 \
    --set hostname=localhost.sslip.io \
    rancher \
    .
