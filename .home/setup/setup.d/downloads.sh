#!/bin/bash
set -e -x

cd $(dirname $0)

. common.sh

download 'https://data.services.jetbrains.com/products/download?platform=linux&code=TBA' ~/.local/jetbrains-toolbox
download https://dl.google.com/go/go1.17.linux-amd64.tar.gz ~/.local/go1.17 ~/.local/go
download https://dl.google.com/dl/cloudsdk/release/google-cloud-sdk.tar.gz ~/.local/google-cloud-sdk
download https://nodejs.org/dist/v15.10.0/node-v15.10.0-linux-x64.tar.xz ~/.local/node-v15.10.0-linux-x64 ~/.local/node
download https://github.com/cli/cli/releases/download/v2.3.0/gh_2.3.0_linux_amd64.tar.gz ~/.local/gh_2.3.0_linux_amd64 ~/.local/gh
download 'https://download.mozilla.org/?product=firefox-95.0-SSL&os=linux64&lang=en-US' ~/.local/firefox-95 ~/.local/firefox

ln -sf ../gh/bin/gh ~/.local/bin/gh

curl -OL https://zoom.us/client/latest/zoom_amd64.deb
trap "rm zoom_amd64.deb" EXIT
sudo apt install -y ./zoom_amd64.deb
