#!/bin/bash

BASE="$(dirname $0)"

if [ ! -e ${BASE}/.git ]; then
    BASE=${HOME}/.home
fi

exec git --git-dir=${BASE}/.git --work-tree=${HOME} "$@"
