#!/usr/bin/perl
###Dongqiang Cheng

$output=$ARGV[0];
open(NF,"$output/all.n50");
while(<NF>){
	chomp $_;
	if($_ ne ""){
		($f,$nf)=$_=~/\/newid\/(\S+)\.oneline\.fas\.alllength\t(\S+)\t/;
		$f_nf{$f}=$nf;
	}
}
close NF;

open(CL,"$output/all.cluster");
while(<CL>){
	chomp $_;
	if($_ ne ""){
		($f,$c)=$_=~/^(\S+)\t(\S+)/;
		$c{$c}=$c;
		if($f_nf{$f} > $c_nf{$c}){
			$c_nf{$c}=$f_nf{$f};
			$c_f{$c}=$f;
		}
	}
}
close CL;

open(OUT,">$output/all.cluster_representative");
open(OUT2,">$output/all.cluster_representative.cmd");
print OUT2 "mkdir $output/representative\n";
foreach $key (sort keys %c){
	if($key ne ""){
		print OUT $key,"\t",$c_f{$key},"\n";
		print OUT2 "cp $output/newid/$c_f{$key} $output/representative/$c_f{$key}\n";
	}
} 
close OUT;
close OUT2;
