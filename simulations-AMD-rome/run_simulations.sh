#!/bin/bash

resultdir="./results"

if [ ! -d "$resultdir" ]; then
    mkdir $resultdir
fi

## Simulations for one CCX
${PBBCACHE}/test/launch_sim_venv3.sh -p \
-a whirlpool-c,lfoc+,kpart,optc:unf:min,optc:stp:max,optc:gmean_ipc:max,optc:gmean_speedup:max,optc:cov:min,optc:hspeed:max,optc:jain:max,optc:m1:min,optc:antt:min,optc:aipc:max \
-O benchmark_categories=./rome-classification.csv -b 55000 \
-m simple -O streaming_part_size=2 -f df -s ./rome_300W.csv \
workloads4.txt > ${resultdir}/results4_apps.txt

