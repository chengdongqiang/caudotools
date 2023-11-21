#!/usr/bin/perl
###Dongqiang Cheng

$length=0;
open(IN,$ARGV[0]);
open(OUT1,">$ARGV[0].singlelength");
while(<IN>){
	chomp $_;
	$len=0;
	if($_=~/^>/){
	}
	else{
		$len=length($_);
		$length=$length+$len;
		print OUT1 $len,"\n";
	}
}
close IN;
close OUT1;
open(OUT2,">$ARGV[0].alllength");
print OUT2 $length,"\n";
#print "alllength\t$length\n";
close OUT2;
