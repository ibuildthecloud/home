#!/bin/bash

k3s-killall.sh
docker rm -fv $(docker ps -qa)
