#!/bin/bash

BASE="$(dirname $0)"
exec git --git-dir=${BASE}/.git --work-tree=${HOME} "$@"
