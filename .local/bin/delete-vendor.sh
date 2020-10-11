#!/bin/bash

find ./vendor/* -depth -type d -name vendor -exec rm -rf {} \; -print
