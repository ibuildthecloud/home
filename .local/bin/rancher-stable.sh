#!/bin/bash
docker rm -fv rancher-stable
docker run --privileged -p 8080:80 -p 8443:443 -d --name rancher-stable --pull=always rancher/rancher:stable
docker logs -f rancher-stable
