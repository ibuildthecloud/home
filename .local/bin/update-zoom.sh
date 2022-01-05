#!/bin/bash
curl -OL https://zoom.us/client/latest/zoom_amd64.deb
trap "rm zoom_amd64.deb" EXIT
sudo apt install -y ./zoom_amd64.deb
