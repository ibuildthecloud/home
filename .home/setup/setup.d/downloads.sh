#!/bin/bash
set -e -x

cd $(dirname $0)

. common.sh

download https://download.jetbrains.com/toolbox/jetbrains-toolbox-1.6.2914.tar.gz ~/.local/jetbrains-toolbox-1.6.2914 ~/.local/jetbrains-toolbox
download https://dl.google.com/go/go1.10.2.linux-amd64.tar.gz ~/.local/go1.10.2 ~/.local/go
#download https://drive.google.com/open?id=1Ru3VnLBSXWECCC-w2mWCtx6lvX6Ry05G ~/.local/jdk1.8.0_161 ~/.local/java
download http://ftp.osuosl.org/pub/eclipse/oomph/epp/oxygen/R/eclipse-inst-linux64.tar.gz ~/.local/eclipse-oxygen ~/.local/eclipse
TAR_STRIP=0 download http://downloads.sourceforge.net/project/liquibase/Liquibase%20Core/liquibase-3.2.2-bin.tar.gz ~/.local/liquibase-3.2.2 ~/.local/liquibase
download https://dl.google.com/dl/cloudsdk/release/google-cloud-sdk.tar.gz ~/.local/google-cloud-sdk
download https://nodejs.org/dist/v8.9.4/node-v8.9.4-linux-x64.tar.xz ~/.local/node-v8.9.4-linux-x64 ~/.local/node
download 'https://download.mozilla.org/?product=firefox-58.0-SSL&os=linux64&lang=en-US' ~/.local/firefox-58 ~/.local/firefox
download https://github.com/Masterminds/glide/releases/download/v0.13.1/glide-v0.13.1-linux-amd64.tar.gz ~/.local/glide-v0.13.1 ~/.local/glide

if [ ! -x ~/.local/liquibase/liquibase ]; then
    chmod +x ~/.local/liquibase/liquibase
fi
