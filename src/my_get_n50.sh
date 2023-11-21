#!/usr/bin/bash
#Dongqiang Cheng

file=$1
src=$2
perl ${src}/my_onelineonefa.pl $file
perl ${src}/my_count_readslength.pl ${file}.oneline.fas
sort -n -r ${file}.oneline.fas.singlelength >${file}.oneline.fas.singlelength.sort
perl ${src}/my_get_n50.pl ${file}.oneline.fas.alllength ${file}.oneline.fas.singlelength


