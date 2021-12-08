#!/bin/bash
set -e -x

cd $(dirname $0)

. common.sh

download 'https://data.services.jetbrains.com/products/download?platform=linux&code=TBA' ~/.local/jetbrains-toolbox
download https://dl.google.com/go/go1.17.linux-amd64.tar.gz ~/.local/go1.17 ~/.local/go
download https://dl.google.com/dl/cloudsdk/release/google-cloud-sdk.tar.gz ~/.local/google-cloud-sdk
download https://nodejs.org/dist/v15.10.0/node-v15.10.0-linux-x64.tar.xz ~/.local/node-v15.10.0-linux-x64 ~/.local/node
download 'https://download.mozilla.org/?product=firefox-95.0-SSL&os=linux64&lang=en-US' ~/.local/firefox-95 ~/.local/firefox
