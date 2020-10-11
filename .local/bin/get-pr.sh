#!/bin/bash
set -e -ex

git checkout master

for i; do
    git fetch ${ORIGIN:-origin} pull/$i/head:pr${i} -f
done

git checkout pr${i}
