#!/usr/bin/perl
###Dongqiang Cheng

open(IN,$ARGV[0]);
while(<IN>){
	chomp $_;
	$id{$_}=$_;
}
close IN;

open(IN2,$ARGV[1]);
open(OUT,">$ARGV[0].vlookuptaxid");
while(<IN2>){
	@line=split(/\t/,$_);
	if($id{$line[0]} ne ""){
		print OUT $_;
	}
}
close IN2;
close OUT;
