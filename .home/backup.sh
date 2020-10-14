#!/bin/bash
set -e -x
if [ ! -e /mnt/backup/darren ]; then
    exit 0
fi
cd ${HOME}
apt-mark showmanual > .packages
if ! diff .packages .home/packages; then
    mv .packages .home/packages
else
    rm .packages
fi
if ! diff .stignore .backup.stignore; then
    cp .stignore .backup.stignore
fi
rsync -av --progress --delete --delete-excluded --exclude-from .stignore . /mnt/backup/darren
#duplicity \
#    --exclude=${HOME}/.cache \
#    --exclude=${HOME}/Downloads* \
#    --exclude=${HOME}/.gpath \
#    --exclude="${HOME}/*.a" \
#    --exclude=${HOME}/.local/share/Steam \
#    --exclude=${HOME}/.local/share/JetBrains/Toolbox/apps \
#    --exclude=${HOME}/.local/share/Trash \
#    --exclude=${HOME}/vmware \
#    --exclude=${HOME}/.trash-cache \
#    --exclude=${HOME}/.glide \
#    --exclude=${HOME}/.GoLand* \
#    --exclude=${HOME}/.PyCharm* \
#    --exclude=${HOME}/.Idea* \
#    --exclude=${HOME}/go/pkg \
#    --exclude=${HOME}/.config/google-chrome \
#    --exclude=${HOME}/.config/Slack \
#    --exclude=${HOME}/.config/Code \
#    --exclude=${HOME}/andriod \
#    --exclude=${HOME}/.m2 \
#    --exclude=${HOME}/go \
#    --exclude=${HOME}/tmp \
#    --exclude=${HOME}/VirtualBox\ VMs \
#    --exclude=${HOME}/src/*/dist \
#    --exclude=${HOME}/src/*/build \
#    --exclude=${HOME}/src/*/bin \
#    --exclude=${HOME}/src/labs/*/dist \
#    --exclude=${HOME}/src/labs/*/build \
#    --exclude=${HOME}/src/labs/*/bin \
#    --exclude=${HOME}/.kube/http-cache \
#    --asynchronous-upload \
#    --progress \
#    ${HOME} gs://darren-backup/inotmac
