#!/usr/bin/bash
#Dongqiang Cheng

for i in results/newid/*.fas
do
	perl my_N50.pl $i
done

