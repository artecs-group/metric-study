#!/bin/bash
nrwindows=(300 250 200 150)

resultdir="./results"
dirworkloads="../"

if [ ! -d "$resultdir" ]; then
    mkdir $resultdir
fi


for w in ${nrwindows[*]}
do
    input_file=simulator-data-${w}W.csv
    for napp in 8 12 16
    do
       ${PBBCACHE}/test/launch_sim_venv3.sh -p \
       -a whirlpool-c,lfoc+,kpart,optc:unf_stp:min,optc:stp:max,optc:gmean_ipc:max,optc:gmean_speedup:max,optc:cov:min,optc:hspeed:max,optc:jain:max,optc:m1:min,optc:antt:min,optc:aipc:max \
       -O benchmark_categories=../skylake-classification.csv -b 76000 \
       -m simple -O streaming_part_size=2 -f df -s ${input_file} \
       ${dirworkloads}/workloads${napp}.txt > ${resultdir}/results${w}W-${napp}_apps.txt
   done
done
