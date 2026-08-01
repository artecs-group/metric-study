#!/bin/bash

resultdir="./results"

if [ ! -d "$resultdir" ]; then
    mkdir $resultdir
fi


for napp in 8 12 16 20
do
    ${PBBCACHE}/test/launch_sim_venv3.sh -p \
-a whirlpool-c,lfoc+,kpart,optc:unf:min,optc:stp:max,optc:gmean_ipc:max,optc:gmean_speedup:max,optc:cov:min,optc:hspeed:max,optc:jain:max,optc:m1:min,optc:antt:min,optc:aipc:max \
-O benchmark_categories=./skylake-classification.csv -b 76000 \
-m simple -O streaming_part_size=2 -f df -s ./skylake_300W.csv \
workloads${napp}.txt > ${resultdir}/results${napp}_apps.txt
done



