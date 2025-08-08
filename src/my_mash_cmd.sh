#!/usr/bin/bash
#Dongqiang Cheng

output=$1
n=$2

echo "" >${output}/mash_all.cmd

for i in $(seq 1 1 $((n-1)))
do
	for j in $(seq $((i+1)) 1 ${n})
	do
		echo "mash dist -k 16 -s 300 ${output}/newid/${i}.fas ${output}/newid/${j}.fas" >>${output}/mash_all.cmd
	done
done

