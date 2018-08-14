FROM ubuntu:18.04
RUN yes | unminimize
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y xubuntu-core
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y xubuntu-desktop
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y \
    aptitude \
    arandr \
    autoconf \
    automake \
    autopoint \
    autotools-dev \
    libltdl-dev \
    libtool \
    m4 \
    baobab \
    bash-completion \
    build-essential \
    cmake \
    cpufreqd \
    curl \
    duplicity \
    git-gui \
    gnome-color-manager \
    graphviz \
    icc-profiles \
    iftop \
    jq \
    libpython2.7-dev \
    libvirt-daemon \
    libvirt-daemon-system \
    lsof \
    meld \
    mercurial \
    mysql-server phpmyadmin \
    nmap \
    openjdk-8-jdk \
    openssh-server \
    pinta \
    pm-utils \
    powertop \
    python-argcomplete \
    python-boto \
    qemu-kvm \
    rsync \
    tshark \
    upx-ucl \
    vim-gtk \
    virt-manager \
    virtualenv \
    whois \
    wireshark \
    xcalib \
    xclip \
    xubuntu-desktop \
    xubuntu-restricted-extras

RUN curl -sfL https://get.docker.io | sh - && \
    systemctl enable docker.socket
RUN curl -o tmp.deb http://download.nomachine.com/download/6.2/Linux/nomachine_6.2.4_1_amd64.deb && \
    dpkg -i tmp.deb && \
    rm tmp.deb
RUN useradd -m -s /bin/bash -G kvm,docker,sudo darren
RUN mkdir /home/darren/.ssh && \
    curl https://github.com/ibuildthecloud.keys > /home/darren/.ssh/authorized_keys && \
    chown -R darren /home/darren
ENV container docker
STOPSIGNAL SIGRTMIN+3
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y systemd
VOLUME /var
VOLUME /opt
VOLUME /mnt
VOLUME /home
CMD ["/sbin/init"]

# docker build -t desktop . && \
# docker run --restart=always -d --name desktop --net=host --privileged -it --tmpfs /run --tmpfs /tmp -v /sys/fs/cgroup:/sys/fs/cgroup -v /lib/modules:/lib/modules:ro -v /lib/firmware:/lib/firmware -v home:/home desktop
