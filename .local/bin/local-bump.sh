#!/bin/bash
set -x

go get github.com/acorn-io/${1}@$(cd ../$1; git rev-parse HEAD)
