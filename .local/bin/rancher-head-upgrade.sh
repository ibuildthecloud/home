#!/bin/bash
docker kill rancher-stable
docker run --privileged -p 8080:80 -p 8443:443 -d --name rancher-head --pull=always --volumes-from=rancher-stable rancher/rancher:master-head --debug
docker logs -f rancher-head
