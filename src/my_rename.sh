#!/usr/bin/bash
#Dongqiang Cheng

output=$1
echo "" >${output}/id_list
j=0
for i in ${output}/eachfa/*.fas
do
	j=$((j+1))
	cp $i ${output}/newid/$j.fas
	echo ${i##*/} $j >>${output}/id_list
done
