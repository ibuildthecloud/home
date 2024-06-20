#!/bin/bash
for i in 0000:01:00.0 0000:61:00.0; do
    sudo nvidia-smi drain -p $i -d
    sudo nvidia-smi drain -p $i -m 0
    sudo nvidia-smi -i $i -pm 1
done
