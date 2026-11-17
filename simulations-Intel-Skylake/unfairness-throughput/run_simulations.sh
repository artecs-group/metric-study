#!/bin/bash

resultdir="./results"
dirworkloads="../"

if [ ! -d "$resultdir" ]; then
    mkdir $resultdir
fi

input_file=../skylake_300W.csv

for napp in 8 12 16
do
    ${PBBCACHE}/test/launch_sim_venv3.sh -p \
            -a optc:unf_stp:min,optc:unf_hmsp:min,optc:unf_gmsp:min,optc:unf_gmeanipc:min \
            -O benchmark_categories=../skylake-classification.csv -b 76000 \
            -m simple -O streaming_part_size=2 -f df -s ${input_file} \
            ${dirworkloads}/workloads${napp}.txt > ${resultdir}/results-${napp}_apps.txt
done
