#!/bin/bash
set -x -e
for i
do
    go mod edit -replace=github.com/acorn-io/${i}=../${i}
done
