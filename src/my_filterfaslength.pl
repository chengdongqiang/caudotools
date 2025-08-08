#!/usr/bin/perl
###Dongqiang Cheng

$mincutoff=$ARGV[1];
$maxcutoff=$ARGV[2];
open(IN,$ARGV[0]);
while(<IN>){
	chomp $_;
	if($_=~/^>/){
		($id)=$_=~/^(>.*)/;
		$id{$id}=$id;
	}
	else{
		$id_seq{$id}=$id_seq{$id}.$_;
		$id_seqlength{$id}=$id_seqlength{$id}+length($_);
	}
}
close IN;

open(OUT,">$ARGV[0].filter$mincutoff\_$maxcutoff.fasta");
foreach my $key (keys %id){
	if($id_seqlength{$key} >=$mincutoff && $id_seqlength{$key} <=$maxcutoff){
		print OUT $key,"\n",$id_seq{$key},"\n";
	}
}
close OUT;
