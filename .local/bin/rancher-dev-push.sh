#!/bin/bash
set -x -e

rancher-dev-build.sh
docker push docker.io/ibuildthecloud/system-agent-installer-rancher:dev 
docker push ibuildthecloud/rancher:dev

docker tag rancher/rancher-agent:master-head ibuildthecloud/rancher-agent:dev
docker push ibuildthecloud/rancher-agent:dev
