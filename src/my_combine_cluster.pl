#!/usr/bin/perl
###Dongqiang Cheng

open(IN1,"$ARGV[0]");
while(<IN1>){
	chomp $_;
	push(@a,$_);
}
close IN1;

open(IN2,"$ARGV[1]");
while(<IN2>){
	chomp $_;
	push(@b,$_);
}
close IN2;


$l=@a;
open(OUT,">$ARGV[2]");
for($i=0;$i<=$l;$i++){
	print OUT $a[$i],"\t",$b[$i],"\n";
}
close OUT;

