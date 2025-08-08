#!/usr/bin/perl
###Dongqiang Cheng

open(IN,"$ARGV[0]");
while(<IN>){
	chomp $_;
	@line=split(/\t/,$_);
	$sid{$line[0]}=$line[0]."\|".$line[1]."\|".$line[2];
}
close IN;

open(FAS,"$ARGV[1]");
open(OUT,">$ARGV[0].fas");
while(<FAS>){
	chomp $_;
	if($_=~/^\>/){
		($id)=$_=~/^\>(.*?)\./;
		if($sid{$id} ne ""){
			$flag="ok";
			print OUT ">".$sid{$id},"\n";
		}
		else{
			$flag="";
		}
	}
	else{
		if($flag eq "ok"){
			print OUT $_,"\n";
		}
	}
}
close FAS;
close OUT;
