#!/bin/bash
set -x -e
make
docker build -t ibuildthecloud/test:d .
docker push ibuildthecloud/test:d
kubectl -n acorn-system delete pod -l app=acorn-api --wait=false
kubectl -n acorn-system delete pod -l app=acorn-controller --wait=false
acorn init --api-server-replicas=1 --controller-replicas=${1:-0} --image ibuildthecloud/test:d
