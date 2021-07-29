#!/bin/bash
set -x -e

export TAG=dev
./scripts/build
rm -rf bin/chart
./scripts/package
docker tag rancher/rancher-agent:master-head ibuildthecloud/rancher-agent:dev
docker tag rancher/rancher:dev ibuildthecloud/rancher:dev
rm -rf package/chart
pushd ./scripts/chart
./build chart
./validate
./package
popd
cp -rf bin/chart package/
cd package
docker build -t ibuildthecloud/system-agent-installer-rancher:dev -f Dockerfile.installer .
