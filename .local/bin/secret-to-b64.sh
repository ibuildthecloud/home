#!/bin/bash
set -e
echo -n "$1" | acorn secret encrypt --plaintext-stdin | base64 -w0
echo
