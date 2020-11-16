#!/bin/bash
set -e

cd $(dirname $0)

if [ ! -e ~/.vim/bundle/Vundle.vim ]; then
    mkdir -p ~/.vim/bundle
    (
        cd ~/.vim/bundle
        git clone https://github.com/gmarik/Vundle.vim.git
    )
fi

mkdir -p ~/.vim/{_backup,_temp,_undo}
