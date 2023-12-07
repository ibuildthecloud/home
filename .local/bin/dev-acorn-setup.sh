#!/bin/bash
set -x -e
if grep '\.\.' go.mod; then
    go mod vendor
fi
make
TAG=${TAG:-vd}

docker build -t ibuildthecloud/test:${TAG} .
rm -rf vendor
if [ "$TAG" != "vd" ]; then
    docker push ibuildthecloud/test:${TAG}
fi
kubectl --context "${CONTEXT}" -n acorn-system delete pod -l app=acorn-api --wait=false
kubectl --context "${CONTEXT}" -n acorn-system delete pod -l app=acorn-controller --wait=false
if [ "${BUILDER:-delete}" = "delete" ]; then
    kubectl --context "${CONTEXT}" -n acorn-image-system delete pod -l app=buildkitd --wait=false
fi
REPLICAS=${1:-0}
if [ "$#" != 0 ]; then
    shift 1
fi
./bin/acorn init --lets-encrypt enabled --lets-encrypt-email 'darren@acorn.io' --lets-encrypt-tos-agree --auto-upgrade-interval=15s --api-server-replicas=1 --controller-replicas=${REPLICAS} --image ibuildthecloud/test:${TAG} --skip-checks "${@}"
