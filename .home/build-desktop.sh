#!/bin/bash
set -x -e
apt update
apt install -y ca-certificates curl gnupg2
echo > /etc/apt/sources.list.d/extra.list
echo "deb [signed-by=/etc/apt/keyrings/syncthing.gpg] https://apt.syncthing.net/ syncthing stable" >> /etc/apt/sources.list.d/extra.list
echo 'deb [signed-by=/etc/apt/keyrings/spotify.gpg] http://repository.spotify.com stable non-free' >> /etc/apt/sources.list.d/extra.list
echo 'deb [signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu mantic stable' >> /etc/apt/sources.list.d/extra.list
echo 'deb [signed-by=/etc/apt/keyrings/oracle.asc] https://download.virtualbox.org/virtualbox/debian jammy contrib' >> /etc/apt/sources.list.d/extra.list
echo "deb [signed-by=/etc/apt/keyrings/ngrok.asc] https://ngrok-agent.s3.amazonaws.com buster main" >> /etc/apt/sources.list.d/extra.list
mkdir -p /etc/apt/keyrings
curl -fsSL https://www.virtualbox.org/download/oracle_vbox_2016.asc > /etc/apt/keyrings/oracle.asc
curl -fsSL https://download.spotify.com/debian/pubkey_7A3A762FAFD4A51F.gpg | gpg --dearmor --yes -o /etc/apt/keyrings/spotify.gpg
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor --yes -o /etc/apt/keyrings/docker.gpg
curl -fsSL https://syncthing.net/release-key.gpg > /etc/apt/keyrings/syncthing.gpg
curl -fsSL https://ngrok-agent.s3.amazonaws.com/ngrok.asc > /etc/apt/keyrings/ngrok.asc

export DEBIAN_FRONTEND=noninteractive

if [ -x /usr/local/sbin/unminimize ]; then yes | unminimize; fi
apt update -y
apt upgrade -y
apt-mark auto $(apt-mark showmanual)
apt-mark manual xubuntu-desktop
apt install -y software-properties-common curl

[ -e slack-desktop.deb ] || curl -fL -o slack-desktop.deb https://downloads.slack-edge.com/releases/linux/4.27.156/prod/x64/slack-desktop-4.27.156-amd64.deb
[ -e google-chrome.deb ] || curl -fL -o google-chrome.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
[ -e code.deb ] || curl -fL -o code.deb 'https://az764295.vo.msecnd.net/stable/c47d83b293181d9be64f27ff093689e8e7aed054/code_1.42.1-1581432938_amd64.deb'
[ -e zoom.deb ] || curl -fL -o zoom.deb 'https://zoom.us/client/latest/zoom_amd64.deb'
[ -e edge.deb ] || curl -fL -o edge.deb 'https://packages.microsoft.com/repos/edge/pool/main/m/microsoft-edge-beta/microsoft-edge-beta_120.0.2210.57-1_amd64.deb?brand=M103'

apt install -y $(cat packages | sort -u) ./*.deb
apt update -y
apt upgrade -y
apt autopurge -y

echo 'fs.inotify.max_user_watches = 524288' > /etc/sysctl.d/99-goland.conf
echo 'fs.inotify.max_user_instances = 128000' >> /etc/sysctl.d/99-goland.conf
echo 'module.nf_conntrack.parameters.hashsize = 131072' > /etc/sysctl.d/99-hashsize.conf

if ! grep -q docker /etc/group; then groupadd -r docker; fi
if ! id darren; then useradd -m -s /bin/bash -G sudo,docker,tty,adm darren; fi

rm *.deb
