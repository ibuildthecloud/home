#!/bin/bash
set -e -x

k3d cluster delete rancher-ha || true
k3d cluster create -a 2 -p '9443:443@server[0]' rancher-ha
helm repo add rancher-latest https://releases.rancher.com/server-charts/latest
helm repo add jetstack https://charts.jetstack.io
helm repo update

kubectl apply --validate=false -f https://github.com/jetstack/cert-manager/releases/download/v0.15.0/cert-manager.crds.yaml

helm install rancher rancher-latest/rancher \
  --namespace cattle-system \
  --version "${VERSION}" \
  --create-namespace \
  --set hostname=ibtc-ha.ngrok.io \
  #--set rancherImageTag=v2.5-head

helm install \
  cert-manager jetstack/cert-manager \
  --create-namespace \
  --namespace cert-manager \
  --version v0.15.0

kubectl -n cattle-system rollout status deploy/rancher
