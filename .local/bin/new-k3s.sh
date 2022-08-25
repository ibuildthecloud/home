#!/bin/bash

k3s-uninstall.sh
curl -sfL https://get.k3s.io | INSTALL_K3S_CHANNEL=v1.23 sh -s - --write-kubeconfig-mode "0644" --docker
cp -f /etc/rancher/k3s/k3s.yaml ${HOME}/.kube/config
