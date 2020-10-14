FROM ubuntu:20.04
COPY packages build-desktop.sh /
#RUN /build-desktop.sh
ENV container docker
STOPSIGNAL SIGRTMIN+3
#RUN DEBIAN_FRONTEND=noninteractive apt-get install -y systemd
VOLUME /var
VOLUME /opt
VOLUME /mnt
VOLUME /home
CMD ["/sbin/init"]

# docker build -t desktop . &&
# docker run --shm-size 2048m --restart=always -d --name desktop --net=host --privileged -it --tmpfs /run --tmpfs /tmp -v /sys/fs/cgroup:/sys/fs/cgroup -v /lib/modules:/lib/modules:ro -v /lib/firmware:/lib/firmware -v home:/home desktop
