#!/bin/bash
set -e -x

cd $(dirname $0)

. common.sh

download 'https://data.services.jetbrains.com/products/download?platform=linux&code=TBA' ~/.local/jetbrains-toolbox
download 'https://download.mozilla.org/?product=firefox-120.0-SSL&os=linux64&lang=en-US' ~/.local/firefox-120 ~/.local/firefox
