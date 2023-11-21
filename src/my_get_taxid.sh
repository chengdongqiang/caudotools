#!/usr/bin/bash
#Dongqiang Cheng

output=$1
awk -F '\t' '{print $3}' ${output}/allid.cleanid.vlookuptaxid | taxonkit reformat -I 1 -f "{k}|{p}|{c}|{o}|{f}|{g}|{s}" >${output}/allid.cleanid.vlookuptaxid.rank
