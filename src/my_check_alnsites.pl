#!/usr/bin/perl
###Dongqiang Cheng

$cutoff=0.8;

open(IN,"$ARGV[0]");
while(<IN>){
	chomp $_;
	if($_=~/^>/){
		$id=$_;
		push(@id,$id);
	}
	else{
		$seqlen=length($_);
		@seq=split(//,$_);
		$i=0;
		foreach (@seq){
			$i++;
			$id_s{$id."_".$i}=$_;
		}
		
	}
}
close IN;

$idn=@id;

for($i=1;$i<=$seqlen;$i++){
	$gap=0;
	for($j=0;$j<$idn;$j++){
		if($id_s{$id[$j]."_".$i} eq "-"){
			$gap=$gap+1;
		}
	}
	$gaprate=$gap/$idn;
	if($gaprate >= $cutoff){
	}
	else{
		push(@newsites,$i);
	}
}

open(OUT,">$ARGV[0].check1.aln");
for($i=0;$i<$idn;$i++){
	print OUT $id[$i],"\n";
	foreach(@newsites){
		print OUT $id_s{$id[$i]."_".$_};
	}
	print OUT "\n";
}
close OUT;

