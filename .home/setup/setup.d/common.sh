#!/bin/bash

trap cleanup EXIT

rme()
{
    if [ -e "$1" ]; then
        rm -rf $1
    fi
}

cleanup()
{
    for i in "${TEMP_FILES[@]}"; do
        rme $i
    done
}

download()
{
    local src=$1
    local dest=$2
    local symlink=$3

    if [ -e "$dest" ]; then
        return
    fi

    rme $symlink
    rme $dest
    
    local tmp=$(mktemp)
    TEMP_FILES+=($tmp)

    curl -L $src > $tmp

    tmpd=$(mktemp -d)
    TEMP_FILES+=($tmpd)

    tar xvf $tmp -C $tmpd --strip-components ${TAR_STRIP:-1}

    if [ -n "$symlink" ]; then
        ln -s $dest $symlink
    fi

    mv $tmpd $dest
}