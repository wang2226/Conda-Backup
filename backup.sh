#!/bin/bash

NOW=$(date "+%Y-%m-%d")
mkdir envs-$NOW
ENVS=$(conda env list | grep '^\w' | cut -d' ' -f1)
for env in $ENVS; do
    source activate $env
    conda env export > envs-$NOW/$env.yml
    echo "Exporting $env"
done