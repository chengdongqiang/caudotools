#!/usr/bin/perl
###Dongqiang Cheng

$output=$ARGV[1];
open(IN,"$ARGV[0]");
open(OUT,">$output/cp_aa.cmd");
print OUT "mkdir $output/aln\n";
while(<IN>){
	@line=split(/\t/,$_);
	($id)=$line[0]=~/(OG\d+\.fa\.m)\.hmm/;#OG0000003.fa.m.hmm
	print OUT "cp $output/og_filter/$id.aln.oneline.fas.check1.aln.check2.aln $output/aln/$id.aln.oneline.fas.check1.aln.check2.aln\n";
} 
close OUT;
close IN;


