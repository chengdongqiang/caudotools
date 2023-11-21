#!/usr/bin/perl
###Dongqiang Cheng

open(IN,"$ARGV[0]");
while(<IN>){
	if($_=~/^>/){
		($tid)=$_=~/^.*?\|(\d+)/;
		open(OUT,">>$ARGV[1]/t$tid.fas");
		print OUT $_;
		close OUT;
	}
	else{
		open(OUT,">>$ARGV[1]/t$tid.fas");
                print OUT $_;
                close OUT;
	}
}
close IN;
