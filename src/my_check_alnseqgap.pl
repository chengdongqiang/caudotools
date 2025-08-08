#!/usr/bin/perl
##Dongqiang Cheng
#
$cutoff=0.3;
open(IN,"$ARGV[0]");
open(OUT,">$ARGV[0].check2.aln");
while(<IN>){
	chomp $_;
	if($_=~/^>/){
		$id=$_;
	}
	elsif($_ ne ""){
		$seqlen=length($_);
		$seq=$_;
		$seq=~s/-//g;
		$newseqlen=length($seq);
		$nongaprate=$newseqlen/$seqlen;
		if($nongaprate >= $cutoff){
			print OUT $id,"\n",$_,"\n";
		}

	}
}
close IN;
close OUT;

