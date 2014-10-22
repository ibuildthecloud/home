#!/bin/bash
set -e

cd $(dirname $0)

for i in setup.d/*; do
    if [[ -f $i && -x $i ]]; then
        ./$i
    fi
done
