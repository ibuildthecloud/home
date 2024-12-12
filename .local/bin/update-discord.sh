#!/bin/bash
curl -L 'https://discord.com/api/download/stable?platform=linux&format=deb' > discord.deb
trap "rm discord.deb" EXIT
sudo apt install -y ./discord.deb
