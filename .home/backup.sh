#!/bin/bash
set -e -x
cd ${HOME}
if command -v apt-mark; then
    apt-mark showmanual > .packages
    if ! diff .packages .home/packages; then
        mv .packages .home/packages
    else
        rm .packages
    fi
fi
if ! diff .stignore .backup.stignore; then
    cp .stignore .backup.stignore
fi
