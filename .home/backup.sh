#!/bin/bash
set -e -x
if [ ! -e /mnt/backup/darren ]; then
    exit 0
fi
cd ${HOME}
if command -v apt-mark; then
    apt-mark showmanual > .packages
    if ! diff .packages .home/packages; then
        mv .packages .home/packages
    else
        rm .packages
    fi
fi
if command -v zypper; then
    zypper se -i | grep '^i+' | awk '{print $3}' > .packages
    if ! diff .packages .home/packages.zypp; then
        mv .packages .home/packages.zypp
    else
        rm .packages
    fi
    cp -f /etc/zypp/repos.d/[^r]*.repo .
fi
if ! diff .stignore .backup.stignore; then
    cp .stignore .backup.stignore
fi
rsync -av --progress --delete --delete-excluded --exclude-from .stignore . /mnt/backup/darren
