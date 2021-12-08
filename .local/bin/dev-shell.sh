#!/bin/bash

docker build -f - -t dev-shell . << EOF
FROM ubuntu:20.04
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt install -y vim iptables socat git golang curl docker.io make squashfs-tools xorriso sudo psmisc
VOLUME /var/lib/rancher
VOLUME /var/lib/docker
VOLUME /var/lib/kubelet
CMD ["/bin/bash", "-c", "mount --make-rshared / && mkdir /run/lock && dockerd & exec bash" ]
EOF
exec docker run --init -w $(pwd) --tmpfs /run -v dev-docker:/var/lib/docker -v $(pwd):$(pwd) -it --rm --privileged dev-shell
