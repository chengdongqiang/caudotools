#!/bin/bash
#Dongqiang Cheng 

src=$1
file=$2
cpu=$3
while read -r i
do
	if [ ! -s ${i}.fasta36.cal ]
	then
		echo $i
		fasta36 -T ${cpu} ${i} ${src}/Caudoviricetes_aa2nt.fas >${i}.fasta36
		perl ${src}/my_cal_nt.pl ${i} ${i}.fasta36
	fi
done < $file

