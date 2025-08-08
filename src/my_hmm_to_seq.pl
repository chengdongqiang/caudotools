#!/usr/bin/perl
###Dongqiang Cheng

open(IN,"$ARGV[0]");
open(OUT,">$ARGV[0].fas");
print OUT ">$ARGV[0]\n";
while(<IN>){
	if($_=~/ - - -/){
		($seq)=$_=~/(\S) - - -/;
		print OUT $seq;
	}
}
close IN;
print OUT "\n";
close OUT;

