#!/bin/perl 
###Dongqiang Cheng 

open(IN,"$ARGV[0]");
while(<IN>){
	chomp $_;
	if($_=~/^>/){
		$seqid=$_;
	}
	elsif($_ ne ""){
		$sqlen=length($_);
	}
}
close IN;

open(IN1,"$ARGV[1]");
while(<IN1>){
	if($_=~/banded Smith-Waterman score\:/){
		($alifrom,$alito)=$_=~/overlap \((\d+)\-(\d+)\:\d+\-\d+\)/;
		if($alifrom < $alito){
			for($i=$alifrom;$i<=$alito;$i++){
				$i_i{$i}=$i;
			}
		}
		elsif($alifrom > $alito){
			for($i=$alito;$i<=$alifrom;$i++){
				$i_i{$i}=$i;
			}
		}
	}
}
close IN1;

%w_w={};
$hitwindowN=0;
$windowsize=100;
$windowN=int($sqlen/$windowsize);
for($j=1;$j<=$windowN;$j++){
	for($k=$j*$windowsize-$windowsize+1;$k<=$j*$windowsize;$k++){
		if($i_i{$k} eq $k){
			$w_w{$j}=$j;
		}
	}
}
if(%w_w){
	$hitN=keys %w_w;
	$hitwindowN=$hitN-1;
}

$score=0;
if($hitwindowN != "0"){
	$p=$hitwindowN/$windowN;
	$N=$windowN;
	$z=1.96;
	$score=($p+1/2/$N*$z*$z-$z*sqrt($p*(1-$p)/$N+$z*$z/4/$N/$N))/(1+1/$N*$z*$z);
}

open(OUT,">$ARGV[1].cal");
print OUT "$seqid\t$sqlen\t$score\n";
close OUT;
