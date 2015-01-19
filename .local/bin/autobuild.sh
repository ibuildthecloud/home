#!/bin/bash

touch -d 0 build-stamp

: ${MANUAL_PATH:=.}

while true; do
    if [ $(find -name "*.go" -newer build-stamp -type f | wc -l) -gt 0 ]; then
        touch build-stamp
        echo Building...
        if [ -x ./scripts/build ]; then
            ./scripts/build && echo Success
        else
            go build ${MANUAL_PATH} && echo Success
        fi
    fi
    sleep 1
done
