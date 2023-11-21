#!/usr/bin/perl
###Dongqiang Cheng

open(IN,"$ARGV[0]");
open(OUT,">$ARGV[0].sum");
while(<IN>){
	chomp $_;
	if($_ ne ""){
		@line=split(/\s+/,$_);
		$l=@line;
		$i=0;
		%tid_tid="";
		$tidn=0;
		for($i=1;$i<$l;$i++){
			@seq=split(/\|/,$line[$i]);
			$tid=$seq[1];
			$tid_tid{$tid}=$tid;
		}
		foreach $key (keys %tid_tid){
			$tidn++;
		}
		print OUT $line[0]," ",$tidn,"\n";
	}
}
close IN1;
