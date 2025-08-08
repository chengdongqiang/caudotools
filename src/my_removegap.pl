open(IN,$ARGV[0]);
open(OUT,">$ARGV[0].rg.fas");
while(<IN>){
	chomp $_;
	if($_=~/^>/){
		$id=$_;
	}
	else{
		$seq=$_=~s/-//gr;
		print OUT $id,"\n",$seq,"\n";
	}
}
close IN;
close OUT;
