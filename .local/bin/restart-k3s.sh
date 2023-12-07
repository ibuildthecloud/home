#!/bin/bash
sudo systemctl stop k3s
sudo systemctl start k3s
docker restart $(docker ps -qa)
