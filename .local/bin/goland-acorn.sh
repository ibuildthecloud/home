#!/bin/bash
acorn init --lets-encrypt enabled --lets-encrypt-email 'darren@acorn.io' --lets-encrypt-tos-agree --auto-upgrade-interval=15s --api-server-replicas=0 --controller-replicas=0 --skip-checks
kubectl delete -n acorn-system service acorn-api
kubectl apply -f - << EOF
apiVersion: v1
kind: Service
metadata:
  name: acorn-api
  namespace: acorn-system
spec:
  ports:
    - protocol: TCP
      port: 7443
      targetPort: 7443
---
apiVersion: v1
kind: Endpoints
metadata:
  name: acorn-api
  namespace: acorn-system
subsets:
- addresses:
  - ip: $(docker network inspect bridge | jq -r '.[0].IPAM.Config[0].Gateway')
  ports:
  - name: ""
    port: 7443
    protocol: TCP
EOF
