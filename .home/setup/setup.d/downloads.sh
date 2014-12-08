#!/bin/bash
set -e

cd $(dirname $0)

. common.sh

download http://mirror.cc.vt.edu/pub/eclipse/technology/epp/downloads/release/luna/SR1/eclipse-cpp-luna-SR1-linux-gtk-x86_64.tar.gz ~/.local/eclipse-cpp-4.4 ~/.local/eclipse-cpp
download https://storage.googleapis.com/golang/go1.3.linux-amd64.tar.gz ~/.local/go1.3 ~/.local/go
download https://googledrive.com/host/0BwwEzt2Cd9h1ZmNRWnlUWTdhcDg/jdk-7u65-linux-x64.tar.gz ~/.local/jdk1.7.0_65 ~/.local/java
download http://mirrors.xmission.com/eclipse/technology/epp/downloads/release/luna/R/eclipse-java-luna-R-linux-gtk-x86_64.tar.gz ~/.local/eclipse-4.4 ~/.local/eclipse
download http://download-cf.jetbrains.com/python/pycharm-community-4.0.tar.gz ~/.local/pycharm-4.0 ~/.local/pycharm
download http://download.jetbrains.com/idea/ideaIC-14.0.1.tar.gz ~/.local/idea-14.0.1 ~/.local/idea
TAR_STRIP=0 download http://downloads.sourceforge.net/project/liquibase/Liquibase%20Core/liquibase-3.2.2-bin.tar.gz ~/.local/liquibase-3.2.2 ~/.local/liquibase
download https://dl.google.com/dl/cloudsdk/release/google-cloud-sdk.tar.gz ~/.local/google-cloud-sdk
download http://nodejs.org/dist/v0.10.33/node-v0.10.33-linux-x64.tar.gz ~/.local/node-v0.10.33 ~/.local/node

if [ ! -x ~/.local/liquibase/liquibase ]; then
    chmod +x ~/.local/liquibase/liquibase
fi
