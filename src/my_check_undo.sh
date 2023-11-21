#!/bin/bash
#Dongqiang Cheng 

file=$1

while read -r i
do
	if [ ! -s ${i}.fasta36.cal ]
	then
		echo $i
	fi
done < $file

