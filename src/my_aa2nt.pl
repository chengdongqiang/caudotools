open(ALN,"$ARGV[0]");
open(OUT,">$ARGV[0].aa2nt.fas");
while(<ALN>){
	chomp $_;
	if($_=~/^>/){
		$id=$_;
	}
	elsif($_ ne ""){
		$seq=$_;
		($nseq0,$nseq1,$nseq2,$nseq3,$nseq4,$nseq5,$nseq6,$nseq7,$nseq8,$nseq9,$nseq10,$nseq11)=&aa2nt($seq);
		print OUT $id."_0\n",$nseq0,"\n";
		print OUT $id."_1\n",$nseq1,"\n";
		print OUT $id."_2\n",$nseq2,"\n";
		print OUT $id."_3\n",$nseq3,"\n";
		print OUT $id."_4\n",$nseq4,"\n";
		print OUT $id."_5\n",$nseq5,"\n";
		print OUT $id."_6\n",$nseq6,"\n";
		print OUT $id."_7\n",$nseq7,"\n";
		print OUT $id."_8\n",$nseq8,"\n";
		print OUT $id."_9\n",$nseq9,"\n";
		print OUT $id."_10\n",$nseq10,"\n";
		print OUT $id."_11\n",$nseq11,"\n";
	}
}
close ALN;
close OUT;


#$seq="ACDEFHI-Y";
#($nseq0,$nseq1,$nseq2,$nseq3,$nseq4,$nseq5,$nseq6,$nseq7,$nseq8,$nseq9,$nseq10,$nseq11)=&aa2nt($seq);
#print $nseq0,"\n";
#print $nseq1,"\n";
#print $nseq2,"\n";
#print $nseq3,"\n";
#print $nseq4,"\n";
#print $nseq5,"\n";
#print $nseq6,"\n";
#print $nseq7,"\n";
#print $nseq8,"\n";
#print $nseq9,"\n";
#print $nseq10,"\n";
#print $nseq11,"\n";
sub aa2nt{
	($seq)=@_;
	#the_Universal_Genetic_Code:
	@codon_A=(GCT,GCC,GCA,GCG,GCT,GCC,GCA,GCG,GCT,GCC,GCA,GCG);
	@codon_C=(TGT,TGC,TGT,TGC,TGT,TGC,TGT,TGC,TGT,TGC,TGT,TGC);
	@codon_D=(GAT,GAC,GAT,GAC,GAT,GAC,GAT,GAC,GAT,GAC,GAT,GAC);
	@codon_E=(GAA,GAG,GAA,GAG,GAA,GAG,GAA,GAG,GAA,GAG,GAA,GAG);
	@codon_F=(TTT,TTC,TTT,TTC,TTT,TTC,TTT,TTC,TTT,TTC,TTT,TTC);
	@codon_G=(GGT,GGC,GGA,GGG,GGT,GGC,GGA,GGG,GGT,GGC,GGA,GGG);
	@codon_H=(CAT,CAC,CAT,CAC,CAT,CAC,CAT,CAC,CAT,CAC,CAT,CAC);
	@codon_I=(ATT,ATC,ATA,ATT,ATC,ATA,ATT,ATC,ATA,ATT,ATC,ATA);
	@codon_K=(AAA,AAG,AAA,AAG,AAA,AAG,AAA,AAG,AAA,AAG,AAA,AAG);
	@codon_L=(TTA,TTG,CTT,CTC,CTA,CTG,TTA,TTG,CTT,CTC,CTA,CTG);
	@codon_M=(ATG,ATG,ATG,ATG,ATG,ATG,ATG,ATG,ATG,ATG,ATG,ATG);
	@codon_N=(AAT,AAC,AAT,AAC,AAT,AAC,AAT,AAC,AAT,AAC,AAT,AAC);
	@codon_P=(CCT,CCC,CCA,CCG,CCT,CCC,CCA,CCG,CCT,CCC,CCA,CCG);
	@codon_Q=(CAA,CAG,CAA,CAG,CAA,CAG,CAA,CAG,CAA,CAG,CAA,CAG);
	@codon_R=(CGT,CGC,CGA,CGG,AGA,AGG,CGT,CGC,CGA,CGG,AGA,AGG);
	@codon_S=(TCT,TCC,TCA,TCG,AGT,AGC,TCT,TCC,TCA,TCG,AGT,AGC);
	@codon_T=(ACT,ACC,ACA,ACG,ACT,ACC,ACA,ACG,ACT,ACC,ACA,ACG);
	@codon_V=(GTT,GTC,GTA,GTG,GTT,GTC,GTA,GTG,GTT,GTC,GTA,GTG);
	@codon_W=(TGG,TGG,TGG,TGG,TGG,TGG,TGG,TGG,TGG,TGG,TGG,TGG);
	@codon_Y=(TAT,TAC,TAT,TAC,TAT,TAC,TAT,TAC,TAT,TAC,TAT,TAC);
	
	$seq=uc($seq);
	@seq=split(//,$seq);
	$nseq0="";
	$nseq1="";
	$nseq2="";
	$nseq3="";
	$nseq4="";
	$nseq5="";
	$nseq6="";
	$nseq7="";
	$nseq8="";
	$nseq9="";
	$nseq10="";
	$nseq11="";
	foreach(@seq){
		$n=$_;
		if($n eq "A"){
			$nseq0=$nseq0.$codon_A[0];
			$nseq1=$nseq1.$codon_A[1];
			$nseq2=$nseq2.$codon_A[2];
			$nseq3=$nseq3.$codon_A[3];
			$nseq4=$nseq4.$codon_A[4];
			$nseq5=$nseq5.$codon_A[5];
			$nseq6=$nseq6.$codon_A[6];
			$nseq7=$nseq7.$codon_A[7];
			$nseq8=$nseq8.$codon_A[8];
			$nseq9=$nseq9.$codon_A[9];
			$nseq10=$nseq10.$codon_A[10];
			$nseq11=$nseq11.$codon_A[11];	
		}
		elsif($n eq "C"){
			$nseq0=$nseq0.$codon_C[0];
			$nseq1=$nseq1.$codon_C[1];
			$nseq2=$nseq2.$codon_C[2];
			$nseq3=$nseq3.$codon_C[3];
			$nseq4=$nseq4.$codon_C[4];
			$nseq5=$nseq5.$codon_C[5];
			$nseq6=$nseq6.$codon_C[6];
			$nseq7=$nseq7.$codon_C[7];
			$nseq8=$nseq8.$codon_C[8];
			$nseq9=$nseq9.$codon_C[9];
			$nseq10=$nseq10.$codon_C[10];
			$nseq11=$nseq11.$codon_C[11];	
		}
		elsif($n eq "D"){
			$nseq0=$nseq0.$codon_D[0];
			$nseq1=$nseq1.$codon_D[1];
			$nseq2=$nseq2.$codon_D[2];
			$nseq3=$nseq3.$codon_D[3];
			$nseq4=$nseq4.$codon_D[4];
			$nseq5=$nseq5.$codon_D[5];
			$nseq6=$nseq6.$codon_D[6];
			$nseq7=$nseq7.$codon_D[7];
			$nseq8=$nseq8.$codon_D[8];
			$nseq9=$nseq9.$codon_D[9];
			$nseq10=$nseq10.$codon_D[10];
			$nseq11=$nseq11.$codon_D[11];	
		}
		elsif($n eq "E"){
			$nseq0=$nseq0.$codon_E[0];
			$nseq1=$nseq1.$codon_E[1];
			$nseq2=$nseq2.$codon_E[2];
			$nseq3=$nseq3.$codon_E[3];
			$nseq4=$nseq4.$codon_E[4];
			$nseq5=$nseq5.$codon_E[5];
			$nseq6=$nseq6.$codon_E[6];
			$nseq7=$nseq7.$codon_E[7];
			$nseq8=$nseq8.$codon_E[8];
			$nseq9=$nseq9.$codon_E[9];
			$nseq10=$nseq10.$codon_E[10];
			$nseq11=$nseq11.$codon_E[11];	
		}
		elsif($n eq "F"){
			$nseq0=$nseq0.$codon_F[0];
			$nseq1=$nseq1.$codon_F[1];
			$nseq2=$nseq2.$codon_F[2];
			$nseq3=$nseq3.$codon_F[3];
			$nseq4=$nseq4.$codon_F[4];
			$nseq5=$nseq5.$codon_F[5];
			$nseq6=$nseq6.$codon_F[6];
			$nseq7=$nseq7.$codon_F[7];
			$nseq8=$nseq8.$codon_F[8];
			$nseq9=$nseq9.$codon_F[9];
			$nseq10=$nseq10.$codon_F[10];
			$nseq11=$nseq11.$codon_F[11];	
		}
		elsif($n eq "G"){
			$nseq0=$nseq0.$codon_G[0];
			$nseq1=$nseq1.$codon_G[1];
			$nseq2=$nseq2.$codon_G[2];
			$nseq3=$nseq3.$codon_G[3];
			$nseq4=$nseq4.$codon_G[4];
			$nseq5=$nseq5.$codon_G[5];
			$nseq6=$nseq6.$codon_G[6];
			$nseq7=$nseq7.$codon_G[7];
			$nseq8=$nseq8.$codon_G[8];
			$nseq9=$nseq9.$codon_G[9];
			$nseq10=$nseq10.$codon_G[10];
			$nseq11=$nseq11.$codon_G[11];	
		}
		elsif($n eq "H"){
			$nseq0=$nseq0.$codon_H[0];
			$nseq1=$nseq1.$codon_H[1];
			$nseq2=$nseq2.$codon_H[2];
			$nseq3=$nseq3.$codon_H[3];
			$nseq4=$nseq4.$codon_H[4];
			$nseq5=$nseq5.$codon_H[5];
			$nseq6=$nseq6.$codon_H[6];
			$nseq7=$nseq7.$codon_H[7];
			$nseq8=$nseq8.$codon_H[8];
			$nseq9=$nseq9.$codon_H[9];
			$nseq10=$nseq10.$codon_H[10];
			$nseq11=$nseq11.$codon_H[11];
		}
		elsif($n eq "I"){
			$nseq0=$nseq0.$codon_I[0];
			$nseq1=$nseq1.$codon_I[1];
			$nseq2=$nseq2.$codon_I[2];
			$nseq3=$nseq3.$codon_I[3];
			$nseq4=$nseq4.$codon_I[4];
			$nseq5=$nseq5.$codon_I[5];
			$nseq6=$nseq6.$codon_I[6];
			$nseq7=$nseq7.$codon_I[7];
			$nseq8=$nseq8.$codon_I[8];
			$nseq9=$nseq9.$codon_I[9];
			$nseq10=$nseq10.$codon_I[10];
			$nseq11=$nseq11.$codon_I[11];	
		}
		elsif($n eq "K"){
			$nseq0=$nseq0.$codon_K[0];
			$nseq1=$nseq1.$codon_K[1];
			$nseq2=$nseq2.$codon_K[2];
			$nseq3=$nseq3.$codon_K[3];
			$nseq4=$nseq4.$codon_K[4];
			$nseq5=$nseq5.$codon_K[5];
			$nseq6=$nseq6.$codon_K[6];
			$nseq7=$nseq7.$codon_K[7];
			$nseq8=$nseq8.$codon_K[8];
			$nseq9=$nseq9.$codon_K[9];
			$nseq10=$nseq10.$codon_K[10];
			$nseq11=$nseq11.$codon_K[11];	
		}
		elsif($n eq "L"){
			$nseq0=$nseq0.$codon_L[0];
			$nseq1=$nseq1.$codon_L[1];
			$nseq2=$nseq2.$codon_L[2];
			$nseq3=$nseq3.$codon_L[3];
			$nseq4=$nseq4.$codon_L[4];
			$nseq5=$nseq5.$codon_L[5];
			$nseq6=$nseq6.$codon_L[6];
			$nseq7=$nseq7.$codon_L[7];
			$nseq8=$nseq8.$codon_L[8];
			$nseq9=$nseq9.$codon_L[9];
			$nseq10=$nseq10.$codon_L[10];
			$nseq11=$nseq11.$codon_L[11];	
		}
		elsif($n eq "M"){
			$nseq0=$nseq0.$codon_M[0];
			$nseq1=$nseq1.$codon_M[1];
			$nseq2=$nseq2.$codon_M[2];
			$nseq3=$nseq3.$codon_M[3];
			$nseq4=$nseq4.$codon_M[4];
			$nseq5=$nseq5.$codon_M[5];
			$nseq6=$nseq6.$codon_M[6];
			$nseq7=$nseq7.$codon_M[7];
			$nseq8=$nseq8.$codon_M[8];
			$nseq9=$nseq9.$codon_M[9];
			$nseq10=$nseq10.$codon_M[10];
			$nseq11=$nseq11.$codon_M[11];	
		}
		elsif($n eq "N"){
			$nseq0=$nseq0.$codon_N[0];
			$nseq1=$nseq1.$codon_N[1];
			$nseq2=$nseq2.$codon_N[2];
			$nseq3=$nseq3.$codon_N[3];
			$nseq4=$nseq4.$codon_N[4];
			$nseq5=$nseq5.$codon_N[5];
			$nseq6=$nseq6.$codon_N[6];
			$nseq7=$nseq7.$codon_N[7];
			$nseq8=$nseq8.$codon_N[8];
			$nseq9=$nseq9.$codon_N[9];
			$nseq10=$nseq10.$codon_N[10];
			$nseq11=$nseq11.$codon_N[11];	
		}
		elsif($n eq "P"){
			$nseq0=$nseq0.$codon_P[0];
			$nseq1=$nseq1.$codon_P[1];
			$nseq2=$nseq2.$codon_P[2];
			$nseq3=$nseq3.$codon_P[3];
			$nseq4=$nseq4.$codon_P[4];
			$nseq5=$nseq5.$codon_P[5];
			$nseq6=$nseq6.$codon_P[6];
			$nseq7=$nseq7.$codon_P[7];
			$nseq8=$nseq8.$codon_P[8];
			$nseq9=$nseq9.$codon_P[9];
			$nseq10=$nseq10.$codon_P[10];
			$nseq11=$nseq11.$codon_P[11];	
		}
		elsif($n eq "Q"){
			$nseq0=$nseq0.$codon_Q[0];
			$nseq1=$nseq1.$codon_Q[1];
			$nseq2=$nseq2.$codon_Q[2];
			$nseq3=$nseq3.$codon_Q[3];
			$nseq4=$nseq4.$codon_Q[4];
			$nseq5=$nseq5.$codon_Q[5];
			$nseq6=$nseq6.$codon_Q[6];
			$nseq7=$nseq7.$codon_Q[7];
			$nseq8=$nseq8.$codon_Q[8];
			$nseq9=$nseq9.$codon_Q[9];
			$nseq10=$nseq10.$codon_Q[10];
			$nseq11=$nseq11.$codon_Q[11];	
		}
		elsif($n eq "R"){
			$nseq0=$nseq0.$codon_R[0];
			$nseq1=$nseq1.$codon_R[1];
			$nseq2=$nseq2.$codon_R[2];
			$nseq3=$nseq3.$codon_R[3];
			$nseq4=$nseq4.$codon_R[4];
			$nseq5=$nseq5.$codon_R[5];
			$nseq6=$nseq6.$codon_R[6];
			$nseq7=$nseq7.$codon_R[7];
			$nseq8=$nseq8.$codon_R[8];
			$nseq9=$nseq9.$codon_R[9];
			$nseq10=$nseq10.$codon_R[10];
			$nseq11=$nseq11.$codon_R[11];	
		}
		elsif($n eq "S"){
			$nseq0=$nseq0.$codon_S[0];
			$nseq1=$nseq1.$codon_S[1];
			$nseq2=$nseq2.$codon_S[2];
			$nseq3=$nseq3.$codon_S[3];
			$nseq4=$nseq4.$codon_S[4];
			$nseq5=$nseq5.$codon_S[5];
			$nseq6=$nseq6.$codon_S[6];
			$nseq7=$nseq7.$codon_S[7];
			$nseq8=$nseq8.$codon_S[8];
			$nseq9=$nseq9.$codon_S[9];
			$nseq10=$nseq10.$codon_S[10];
			$nseq11=$nseq11.$codon_S[11];	
		}
		elsif($n eq "T"){
			$nseq0=$nseq0.$codon_T[0];
			$nseq1=$nseq1.$codon_T[1];
			$nseq2=$nseq2.$codon_T[2];
			$nseq3=$nseq3.$codon_T[3];
			$nseq4=$nseq4.$codon_T[4];
			$nseq5=$nseq5.$codon_T[5];
			$nseq6=$nseq6.$codon_T[6];
			$nseq7=$nseq7.$codon_T[7];
			$nseq8=$nseq8.$codon_T[8];
			$nseq9=$nseq9.$codon_T[9];
			$nseq10=$nseq10.$codon_T[10];
			$nseq11=$nseq11.$codon_T[11];	
		}
		elsif($n eq "V"){
			$nseq0=$nseq0.$codon_V[0];
			$nseq1=$nseq1.$codon_V[1];
			$nseq2=$nseq2.$codon_V[2];
			$nseq3=$nseq3.$codon_V[3];
			$nseq4=$nseq4.$codon_V[4];
			$nseq5=$nseq5.$codon_V[5];
			$nseq6=$nseq6.$codon_V[6];
			$nseq7=$nseq7.$codon_V[7];
			$nseq8=$nseq8.$codon_V[8];
			$nseq9=$nseq9.$codon_V[9];
			$nseq10=$nseq10.$codon_V[10];
			$nseq11=$nseq11.$codon_V[11];	
		}
		elsif($n eq "W"){
			$nseq0=$nseq0.$codon_W[0];
			$nseq1=$nseq1.$codon_W[1];
			$nseq2=$nseq2.$codon_W[2];
			$nseq3=$nseq3.$codon_W[3];
			$nseq4=$nseq4.$codon_W[4];
			$nseq5=$nseq5.$codon_W[5];
			$nseq6=$nseq6.$codon_W[6];
			$nseq7=$nseq7.$codon_W[7];
			$nseq8=$nseq8.$codon_W[8];
			$nseq9=$nseq9.$codon_W[9];
			$nseq10=$nseq10.$codon_W[10];
			$nseq11=$nseq11.$codon_W[11];	
		}
		elsif($n eq "Y"){
			$nseq0=$nseq0.$codon_Y[0];
			$nseq1=$nseq1.$codon_Y[1];
			$nseq2=$nseq2.$codon_Y[2];
			$nseq3=$nseq3.$codon_Y[3];
			$nseq4=$nseq4.$codon_Y[4];
			$nseq5=$nseq5.$codon_Y[5];
			$nseq6=$nseq6.$codon_Y[6];
			$nseq7=$nseq7.$codon_Y[7];
			$nseq8=$nseq8.$codon_Y[8];
			$nseq9=$nseq9.$codon_Y[9];
			$nseq10=$nseq10.$codon_Y[10];
			$nseq11=$nseq11.$codon_Y[11];	
		}
		else{
			$nseq0=$nseq0."---";
			$nseq1=$nseq1."---";
			$nseq2=$nseq2."---";
			$nseq3=$nseq3."---";
			$nseq4=$nseq4."---";
			$nseq5=$nseq5."---";
			$nseq6=$nseq6."---";
			$nseq7=$nseq7."---";
			$nseq8=$nseq8."---";
			$nseq9=$nseq9."---";
			$nseq10=$nseq10."---";
			$nseq11=$nseq11."---";
		}
	}
	return($nseq0,$nseq1,$nseq2,$nseq3,$nseq4,$nseq5,$nseq6,$nseq7,$nseq8,$nseq9,$nseq10,$nseq11);
}
