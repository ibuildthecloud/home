#!/bin/bash
set -e -x

git push gh -f
hub pull-request "$@"
