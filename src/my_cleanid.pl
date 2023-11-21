#!/usr/bin/perl
###Dongqiang Cheng

open(IN,$ARGV[0]);
open(OUT,">$ARGV[0].cleanid");
while(<IN>){
	chomp $_;
	if($_ ne ""){
		($id)=$_=~/^\>(.*?)\./;
		print OUT $id,"\n";
	}
}
close IN;
close OUT;

