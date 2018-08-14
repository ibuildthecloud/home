#!/bin/bash
set -e -x
cd ${HOME}
duplicity \
    --exclude=${HOME}/.cache \
    --exclude=${HOME}/Downloads* \
    --exclude=${HOME}/.gpath \
    --exclude="${HOME}/*.a" \
    --exclude=${HOME}/.local/share/Steam \
    --exclude=${HOME}/.local/share/JetBrains \
    --exclude=${HOME}/.local/share/Trash \
    --exclude=${HOME}/vmware \
    --exclude=${HOME}/.trash-cache \
    --exclude=${HOME}/.glide \
    --exclude=${HOME}/.GoLand* \
    --exclude=${HOME}/.PyCharm* \
    --exclude=${HOME}/.Idea* \
    --exclude=${HOME}/.config/google-chrome \
    --exclude=${HOME}/.config/Slack \
    --exclude=${HOME}/.config/Code \
    --progress \
    ${HOME} gs://darren-backup/inotmac
