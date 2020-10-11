#!/bin/bash
set -e -x

cd $(dirname $0)

. common.sh

download 'https://download.jetbrains.com/toolbox/jetbrains-toolbox-1.17.6802.tar.gz' ~/.local/jetbrains-toolbox-1.17.6802.tar.gz ~/.local/jetbrains-toolbox
download https://dl.google.com/go/go1.14.2.linux-amd64.tar.gz ~/.local/go1.14.2 ~/.local/go
download https://dl.google.com/dl/cloudsdk/release/google-cloud-sdk.tar.gz ~/.local/google-cloud-sdk
download https://nodejs.org/dist/v10.16.2/node-v10.16.2-linux-x64.tar.xz ~/.local/node-v10.16.2-linux-x64 ~/.local/node
download 'https://download.mozilla.org/?product=firefox-75.0-SSL&os=linux64&lang=en-US' ~/.local/firefox-75 ~/.local/firefox
download https://github.com/Masterminds/glide/releases/download/v0.13.3/glide-v0.13.3-linux-amd64.tar.gz ~/.local/glide-v0.13.3 ~/.local/glide
