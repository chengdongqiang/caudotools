#!/usr/bin/perl
###Dongqiang Cheng
#
$n=$ARGV[1];
open(IN,$ARGV[0]);
while(<IN>){
	chomp $_;
	if($_ ne ""){
                #results/newid/1.fas    results/newid/2.fas     1 
		($id1,$id2,$dist)=$_=~/(\d+\.fas)\t.*?(\d+\.fas)\t(.*)/;
		$ids_dist{$id1."_".$id2}=$dist;
		$ids_dist{$id2."_".$id1}=$dist;
	}
}
close IN;

open(OUT,">$ARGV[0].out");
print OUT "id1\tid2\tdist\n";
for($i=1;$i<=$n-1;$i++){
	for($j=$i+1;$j<=$n;$j++){
		if($ids_dist{$i.".fas_".$j.".fas"} ne ""){
			print OUT $i,".fas\t",$j,".fas\t",$ids_dist{$i.".fas_".$j.".fas"},"\n";
			print OUT $j,".fas\t",$i,".fas\t",$ids_dist{$j.".fas_".$i.".fas"},"\n";
		}
		else{
			print OUT $i,".fas\t",$j,".fas\t1\n";
			print OUT $j,".fas\t",$i,".fas\t1\n";
		}
	}
}
close OUT;
