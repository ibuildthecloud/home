#!/bin/bash

cd $(dirname $0)

dconf dump /org/compiz/ > compiz.settings
#gconftool-2 --dump /apps/gnome-do > gnome-do.xml
