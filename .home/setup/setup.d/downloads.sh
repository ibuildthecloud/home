#!/bin/bash
set -e -x

cd $(dirname $0)

. common.sh

download 'https://data.services.jetbrains.com/products/download?platform=linux&code=TBA' ~/.local/jetbrains-toolbox
download https://dl.google.com/go/go1.18.linux-amd64.tar.gz ~/.local/go1.18 ~/.local/go
download https://dl.google.com/dl/cloudsdk/release/google-cloud-sdk.tar.gz ~/.local/google-cloud-sdk
download 'https://download.mozilla.org/?product=firefox-104.0-SSL&os=linux64&lang=en-US' ~/.local/firefox-104 ~/.local/firefox
