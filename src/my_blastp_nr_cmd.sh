#!/usr/bin/bash
#Dongqiang Cheng

output=$1
echo "" >${output}/blastp_nr_all.cmd

for i in ${output}/og_filter/*.fa.m.hmm.fas
do
	echo "blastp -evalue 0.01 -outfmt 6 -query ${i} -db nr -max_target_seqs 1 -out ${i}.blastp_nr" >>${output}/blastp_nr_all.cmd
done

