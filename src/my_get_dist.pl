#!/usr/bin/perl
###Dongqiang Cheng

open(DIS,$ARGV[0]);
open(OUT,">$ARGV[0].out");
while(<DIS>){
	chomp $_;
	@line=split(/\t/,$_);
	if($line[2] ne ""){
		print OUT $line[0],"\t",$line[1],"\t",$line[2],"\n";
	}
}
close DIS;
close OUT;
