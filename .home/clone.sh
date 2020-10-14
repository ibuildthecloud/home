#!/bin/bash

rm -rf $HOME/.home
mkdir $HOME/.home
git -C $HOME/.home clone --bare https://github.com/ibuildthecloud/home .git
git --git-dir=${HOME}/.home/.git --work-tree=${HOME} reset --hard HEAD
