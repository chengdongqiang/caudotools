#!/usr/bin/perl
###Dongqiang Cheng

open(IN,"$ARGV[0]");#allid.cleanid.vlookuptaxid.rank
while(<IN>){
	chomp $_;
	if($_ ne ""){
		($tid,$rank)=$_=~/^(.*)\t(.*)/;
		$rank=~s/ /_/g;
		$tid_rank{$tid}=$rank;
	}
}
close IN;

open(IN2,"$ARGV[1]");#allid.cleanid.vlookuptaxid
open(OUT,">$ARGV[2]");#seqid_taxid_rank.list
while(<IN2>){
	chomp $_;
	if($_ ne ""){
		@line=split(/\t/,$_);
		print OUT $line[0],"\t",$line[2],"\t",$tid_rank{$line[2]},"\n";
	}
}
close IN2;
close OUT;
