#!/bin/bash

cat | docker build -f - -t dev-shell << EOF
FROM ubuntu
RUN apt-get update && \
    apt install -y vim
VOLUME /var/lib/rancher
VOLUME /var/lib/docker
VOLUME /var/lib/kubelet
EOF
exec docker run -w $(pwd) -v /var/lib/rancher -v /var/lib/docker -v /var/lib/docker -v $(pwd):$(pwd) -it --rm  --privileged dev-shell
