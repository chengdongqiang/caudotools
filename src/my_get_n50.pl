#!/usr/bin/perl
###Dongqiang Cheng

open(IN1,$ARGV[0]);
while(<IN1>){
	chomp $_;
	($total)=$_;
	$half=$total/2;
}
close IN1;

open(IN2,$ARGV[1]);
open(OUT,">$ARGV[0].n50");
while(<IN2>){
	chomp $_;
	$sum=$sum+$_;
	if($sum >= $half && $flag eq ""){
		print OUT $ARGV[0],"\t",$_,"\t",$total,"\n";
		print $ARGV[0],"\t",$_,"\t",$total,"\n";
		$flag="ok";
	}
}
close IN2;
close OUT;

