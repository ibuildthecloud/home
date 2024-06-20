#!/bin/bash
for i in 0000:01:00.0 0000:61:00.0; do
    sudo nvidia-smi -i $i -pm 0
    sudo nvidia-smi drain -p $i -q -m 1
done
