## **Caudotools: Identification of Tailed Phage Caudoviricetes Virus Sequences from Error-Prone Nanopore Long Reads**

### **Introduction**
Tailed bacteriophages, also known as phages, belong to the class Caudoviricetes and share a common ancestry. The advent of long-read sequencing technology has significantly accelerated the discovery of phages. However, the error-prone nature of long reads often result in a high rate of open reading frame shifts, causing virtual protein translation failures. Previous phage identification software, which relies on protein Hidden Markov Model searches, may lose its effectiveness. To overcome this limitation, we introduce Caudotools, consisting of two commands: caudocog and caudoscan.

Caudocog is developed based on OrthoFinder and other softwares, creating a comprehensive nucleotide sequence database for core Caudoviricetes orthologous groups. The resulting output, Caudoviricetes_aa2nt.fas, serves as the search database for caudoscan.

Caudoscan is designed to identify phage sequences through nucleotide homologous searches and calculation of a window-based score following the Wilson score interval method. A caudoscan score of 0.3 serves as a judgement threshold. Sequences with a caudoscan score greater than 0.3 are categorized as phage sequences. Simulations using error-prone long reads of 40 kb and 20 kb showed that the F1 score for caudoscan reached 0.95 and 0.90, respectively.

### **Caudocog Prerequisites**
The following software must be installed and added to the system’s PATH: Prodigal, MASH, taxonkit, OrthoFinder, HMMER, MUSCLE, Blastp (with the nr database available) and GNU Parallel. 

The prodigal was used for contigs gene recognition and translation. The prodigal by Hyatt, et al was cited here: Prodigal: prokaryotic gene recognition and translation initiation site identification. BMC Bioinformatics 11, 119 (2010). https://doi.org/10.1186/1471-2105-11-119

The mash was used for calculating genome distances for genome clustering. The mash by ONDOV, B. D., et al was cited here: Mash: fast genome and metagenome distance estimation using MinHash. Genome Biol, 17, 132 (2016). https://doi.org/10.1186/s13059-016-0997-x

The taxonkit was used to obtained the sequences taxon rank infromation. The taxonkit by Wei Shen and Hong Ren cited here: TaxonKit: A practical and efficient NCBI taxonomy toolkit. Journal of Genetics and Genomics, 48, 9 (2021). https://doi.org/10.1016/j.jgg.2021.03.006

The OrthoFinder was used to compute clusters of orthologous groups of protein sequences. The OrthoFinder by Emms and Kelly was cited here: OrthoFinder: phylogenetic orthology inference for comparative genomics. Genome Biol, 20, 238 (2019). https://doi.org/10.1186/s13059-019-1832-y

The HMMER was used for searching the Caudoviricetes core HMMs against the contigs predicted proteins. http://hmmer.org/

The MUSCLES5 was used to align the cluster of orthologous groups. The MUSCLES5 by Edgar was cited here:  Muscle5: High-accuracy alignment ensembles enable unbiased assessments of sequence homology and phylogeny. Nat Commun, 13, 6968 (2022). https://doi.org/10.1038/s41467-022-34630-w

The Blastp searches against the NR database were performed for each HMM consensus sequences to make sure the HMM is an effective core orthologous groups. The blastp by ALTSCHUL, et al. was cited here: Basic local alignment search tool. J Mol Biol, 215, 403-10 (1990). https://doi.org/10.1016/S0022-2836(05)80360-2

The GNU parallel was applied for multiple serial command line parallel running. The GNU parallel by Ole Tange was cited here: Tange, O. (2021, August 22). GNU Parallel 20210822 ('Kabul'). Zenodo. https://doi.org/10.5281/zenodo.5233953.

### **Caudoscan Prerequisites**
Caudoscan mainly implemented the fasta36 tool for DNA sequence similarity searching. The program fasta36 must be installed and made available in the system’s PATH. The FASTA programs was by W.R. Pearson and D.J. Lipman (1988), "Improved tools for biological sequence comparison", PNAS 85:2444-2448. https://doi.org/10.1073/pnas.85.8.2444

The search database, Caudoviricetes_aa2nt.fas, can be obtained from caudocog. Once obtained, it should be placed in the "src" directroy. In the "src" directory, we have already provided a Caudoviricetes_aa2nt.fas file. You can replace this file with the one generated from caudocog.

### **Install**
```
git clone https://github.com/chengdongqiang/caudotools.git
```
Add caudocog and caudoscan path to your environment variable $PATH. Edit file ~/.bash_profile and add one line at end of the file:

export PATH=$PATH:/caudotools/path
```
source ~/.bash_profile
```
### **Caudocog Usage**
It will be taken about 5 days to run caudocog when using 50 CPU cores.
```
nohup caudocog -o output_diractory -t number_of_threads >temp.log 2>&1 &
```


### **Caudoscan Usage**
For 100MB sequenes, it will be taken about 15 hours to run caudoscan when using 50 CPU cores.
```
nohup caudoscan -i input_contigs_fasta_format.fas -o output_diractory -t number_of_threads >temp.log 2>&1 &
```

### **Example**
We provide an example here ./caudotools/example/test.fa
First go to the test.fa contaning directory
```
cd ./caudotools/example
```
Then run Caudoscan
```
nohup caudoscan -i test.fa -o test_output -t 50 >temp.temp 2>&1 &
```
The caudoscan results will be in ./caudotools/example/test_output/test.fa.caudoscan.txt file.
If a sequence had a caudoscan score greater than 0.3, it was categorized as a phage sequence.

