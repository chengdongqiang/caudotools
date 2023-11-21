#!/usr/bin/perl
###Dongqiang Cheng

$cutoff=$ARGV[1];
$output=$ARGV[2];
open(IN,"$ARGV[0]");
open(OUT,">$output/og_filter.cmd");
print OUT "mkdir $output/og_filter\n";
while(<IN>){
	($og,$n)=$_=~/^(\S+)\: (\d+)/;
	if($n >= $cutoff){
		print OUT "cp $output/orthofinder_og/Orthogroup_Sequences/$og.fa $output/og_filter/$og.fa\n";
	}
} 
close OUT;
close IN;


