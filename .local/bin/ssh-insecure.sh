#!/bin/bash
exec ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no "$@"
