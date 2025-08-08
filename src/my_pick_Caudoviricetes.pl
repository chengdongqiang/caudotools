#!/usr/bin/perl
###Dongqiang Cheng

open(IN,"$ARGV[0]");
open(OUT,">$ARGV[0].pick_Caudoviricetes.list");
while(<IN>){
	@line1=split(/\t/,$_);
	@line2=split(/\|/,$line1[2]);
	if($line2[2] eq "Caudoviricetes"){
		print OUT $_;
	}
}
close IN;
close OUT;
