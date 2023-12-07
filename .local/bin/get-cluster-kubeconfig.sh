#!/bin/bash

if [ -z "$KUBECONFIG" ]; then
    echo KUBECONFIG env var must be set
    exit 1
fi

TOKEN=$(acorn --kubeconfig $KUBECONFIG -j acorn secrets reveal manager.token-admin -o json | jq -r '.items[0].data.token')
HOST=$(acorn --kubeconfig $KUBECONFIG ps -o json manager.infra-provisioning | jq -r '.items[0].status.appStatus.endpoints[0].address')

TEMP=$(mktemp get-output-XXXXXX)
trap "rm $TEMP" EXIT

cat > $TEMP << EOF
apiVersion: v1
clusters:
- cluster:
    server: https://$HOST
  name: default
contexts:
- context:
    cluster: default
    user: default
  name: default
current-context: default
kind: Config
users:
- name: default
  user:
    token: $TOKEN
EOF

cat $TEMP | sed 's/^/# /'

if [ "$#" = 0 ]; then
    kubectl --kubeconfig $TEMP get clusters -A
else
    read NAMESPACE NAME GARBAGE < <(kubectl --kubeconfig $TEMP get clusters -A | grep $1)
    echo -e "---\n# Cluster $NAMESPACE/$NAME\n"
    kubectl --kubeconfig $TEMP get --raw /apis/internal.provisioning.manager.acorn.io/v1/namespaces/${NAMESPACE}/clusters/${NAME}/kubeconfig | jq -r .kubeconfig | base64 -d
fi
