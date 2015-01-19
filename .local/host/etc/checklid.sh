#!/bin/bash
set -e

if ! grep -q open /proc/acpi/button/lid/LID/state; then
    pm-suspend
fi
