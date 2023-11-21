#!/bin/perl 
##Dongqiang Cheng 

open(FA,"$ARGV[0]");
open(OUT,">$ARGV[0].oneline.fas");
$flag="";
while(<FA>){
	chomp $_;
	if($_=~/^>/){
		if($flag eq "ok"){
			print OUT "\n";
		}
		print OUT $_,"\n";
		$flag="ok";
	}
	else{
		print OUT $_;
	}
}
close FA;
print OUT "\n";
close OUT;
