#!/bin/bash
set -x -e
apt update
apt install -y ca-certificates curl gnupg2
rm -rf /etc/apt/sources.list.d/*
echo 'deb http://us.archive.ubuntu.com/ubuntu focal main universe restricted' > /etc/apt/sources.list
echo 'deb http://us.archive.ubuntu.com/ubuntu focal-updates main universe restricted' >> /etc/apt/sources.list
echo 'deb http://us.archive.ubuntu.com/ubuntu focal-security main universe restricted' >> /etc/apt/sources.list
echo 'deb http://us.archive.ubuntu.com/ubuntu focal-backports main universe restricted' >> /etc/apt/sources.list
echo 'deb https://apt.syncthing.net/ syncthing stable' >> /etc/apt/sources.list
echo 'APT::Install-Recommends "false";' > /etc/apt/apt.conf.d/02norecommends
echo 'APT::Install-Suggests "false";' >> /etc/apt/apt.conf.d/02norecommends
echo 'APT::Get::Install-Recommends "false";' >> /etc/apt/apt.conf.d/02norecommends
echo 'APT::Get::Install-Suggests "false";' >> /etc/apt/apt.conf.d/02norecommends
echo 'deb http://repository.spotify.com stable non-free' >> /etc/apt/sources.list
echo 'deb https://download.docker.com/linux/ubuntu focal stable' >> /etc/apt/sources.list
echo 'deb [arch=amd64] https://download.virtualbox.org/virtualbox/debian focal contrib' >> /etc/apt/sources.list
curl -fsSL https://www.virtualbox.org/download/oracle_vbox_2016.asc | apt-key add -
curl -fsSL https://download.spotify.com/debian/pubkey_0D811D58.gpg | apt-key add -
curl -fsSL https://download.spotify.com/debian/pubkey.gpg | apt-key add -
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
curl -fsSL https://syncthing.net/release-key.txt | apt-key add -

export DEBIAN_FRONTEND=noninteractive

if [ -x /usr/local/sbin/unminimize ]; then yes | unminimize; fi
apt update -y
apt upgrade -y
if [ ! -e stage-one ]; then
    apt-mark auto $(apt-mark showmanual)
    apt-mark manual ubuntu-minimal
    apt autopurge -y
    apt install -y software-properties-common curl
fi
touch stage-one

add-apt-repository -y ppa:dqlite/stable
[ -e virtualbox.deb ] || curl -fL -o virtualbox.deb "https://download.virtualbox.org/virtualbox/6.1.14/virtualbox-6.1_6.1.14-140239~Ubuntu~eoan_amd64.deb"
[ -e slack-desktop.deb ] || curl -fL -o slack-desktop.deb https://downloads.slack-edge.com/linux_releases/slack-desktop-4.10.0-amd64.deb
[ -e google-chrome.deb ] || curl -fL -o google-chrome.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
[ -e veracrypt.deb ] || curl -fL -o veracrypt.deb 'https://launchpad.net/veracrypt/trunk/1.24-update3/+download/veracrypt-1.24-Update3-Ubuntu-18.04-amd64.deb'
[ -e code.deb ] || curl -fL -o code.deb 'https://az764295.vo.msecnd.net/stable/c47d83b293181d9be64f27ff093689e8e7aed054/code_1.42.1-1581432938_amd64.deb'
[ -e zoom.deb ] || curl -fL -o zoom.deb 'https://zoom.us/client/latest/zoom_amd64.deb'

apt install -y $(cat packages | sort -u) ./*.deb
apt update -y
apt upgrade -y
apt autoremove -y

echo 'fs.inotify.max_user_watches = 524288' > /etc/sysctl.d/99-goland.conf
echo 'module.nf_conntrack.parameters.hashsize = 131072' > /etc/sysctl.d/99-hashsize.conf

if ! grep -q docker /etc/group; then groupadd -r docker; fi
if ! id darren; then useradd -m -s /bin/bash -G sudo,docker,tty,adm darren; fi
