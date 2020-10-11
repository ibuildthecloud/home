#!/bin/bash
set -e -x
if [ "$#" -gt 0 ]; then
    bump.sh "$@"
fi
go mod tidy
if [ -e vendor ]; then
    go mod vendor
    git add vendor
fi
git add go.sum go.mod
git commit -m "Update vendor"
git show --stat
git show go.mod
