#!/bin/bash
set -e

cd $(dirname $0)

. common.sh

download https://storage.googleapis.com/golang/go1.3.linux-amd64.tar.gz ~/.local/go1.3 ~/.local/go
download https://googledrive.com/host/0BwwEzt2Cd9h1ZmNRWnlUWTdhcDg/jdk-7u65-linux-x64.tar.gz ~/.local/jdk1.7.0_65 ~/.local/java
download http://mirrors.xmission.com/eclipse/technology/epp/downloads/release/luna/R/eclipse-java-luna-R-linux-gtk-x86_64.tar.gz ~/.local/eclipse-4.4 ~/.local/eclipse
