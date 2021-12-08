#!/bin/bash

helm upgrade -n cattle-system --version 2.5.3 --reuse-values --set rancherImageTag=master-head rancher rancher-latest/rancher
