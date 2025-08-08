#!/usr/bin/perl
###Dongqiang Cheng

$output=$ARGV[1];
open(IN,"$ARGV[0]");
open(OUT,">$output/hmm_filter.cmd");
print OUT "mkdir $output/hmm_filter\n";
while(<IN>){
	@line=split(/\t/,$_);
	($hmm)=$line[0]=~/(OG\d+\.fa\.m\.hmm)/;#OG0000003.fa.m.hmm
	print OUT "cp $output/og_filter/$hmm $output/hmm_filter/$hmm\n";
} 
close OUT;
close IN;


