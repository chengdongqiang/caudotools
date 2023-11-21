#!/bin/perl 
##Dongqiang Cheng 

$output=$ARGV[1];
mkdir "$output/temp";
open(IN,"$ARGV[0]");
$i=0;
while(<IN>){
	if($_=~/>/){
		$i++;
		if($flag eq "ok"){
			close OUT;
		}
		open(OUT,">$output/temp/c$i.fas");
		print OUT $_;
		$flag="ok";
	}
	else{
		print OUT $_;
	}
}
close IN;

