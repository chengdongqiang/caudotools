## **Caudotools: identification of tailed phage Caudoviricetes viruses contigs from error-prone Nanopore long reads**

### **Introduction**
Tailed bacteriophages, also known as phages, are viruses that share a common ancestry and classified into the class Caudoviricetes. Long-read sequencing technology is greatly accelerating phage discoveries. The error-prone long reads often result in a high rate of open reading frame shifts, causing virtual protein translation failures. Previous phage identification software, which relies on protein Hidden Markov Model searches, will lose its effectiveness. To overcome this limitation, we present Caudotools which included two commands: caudocog and caudoscan.

Caudocog has been developed based on OrthoFinder and other software to create a comprehensive database of nucleotide sequences for core Caudoviricetes orthologous groups. The resulting output, Caudoviricetes_aa2nt.fas can serve as the search database for caudoscan.

Caudoscan has been developed to identify phage contigs through nucleotide homologous searches and calculation of a window-based score following the Wilson score interval method. Caudoscan score of 0.3 served as a judgement threshold. If a contig had a caudoscan score greater than 0.3, it was categorized as a phage contig. Simulations using error-prone long reads of 40 kb and 20 kb showed that the F1 score for caudoscan reached 0.95 and 0.90, respectively.

### **Caudocog Prerequisites**
The following software must be installed and added to the system’s PATH: prodigal, mash, orthofinder, hmmer, muscle, blastp (with the nr database available) and parallel. 

The prodigal was used for contigs gene recognition and translation. The prodigal by Hyatt, et al was cited here: Prodigal: prokaryotic gene recognition and translation initiation site identification. BMC Bioinformatics 11, 119 (2010). https://doi.org/10.1186/1471-2105-11-119

The mash was used for calculating genome distances for genome clustering. The mash by ONDOV, B. D., et al was cited here: Mash: fast genome and metagenome distance estimation using MinHash. Genome Biol, 17, 132 (2016). https://doi.org/10.1186/s13059-016-0997-x

The OrthoFinder was used to compute clusters of orthologous groups of protein sequences. The OrthoFinder by Emms and Kelly was cited here: OrthoFinder: phylogenetic orthology inference for comparative genomics. Genome Biol, 20, 238 (2019). https://doi.org/10.1186/s13059-019-1832-y

The HMMER was used for searching the Caudoviricetes core HMMs against the contigs predicted proteins. http://hmmer.org/

The MUSCLES5 was used to align the cluster of orthologous groups. The MUSCLES5 by Edgar was cited here:  Muscle5: High-accuracy alignment ensembles enable unbiased assessments of sequence homology and phylogeny. Nat Commun, 13, 6968 (2022). https://doi.org/10.1038/s41467-022-34630-w

The Blastp searches against the NR database were performed for each HMM consensus sequences to make sure the HMM is an effective core orthologous groups. The blastp by ALTSCHUL, et al. was cited here: Basic local alignment search tool. J Mol Biol, 215, 403-10 (1990). https://doi.org/10.1016/S0022-2836(05)80360-2

The GNU parallel was applied for multiple serial command line parallel running. The GNU parallel by Ole Tange was cited here: Tange, O. (2021, August 22). GNU Parallel 20210822 ('Kabul'). Zenodo. https://doi.org/10.5281/zenodo.5233953.

### **Caudoscan Prerequisites**
Caudoscan mainly implemented the fasta36 tool for DNA sequence similarity searching. The program fasta36 must be installed and made available in the system’s PATH. The FASTA programs was by W.R. Pearson and D.J. Lipman (1988), "Improved tools for biological sequence comparison", PNAS 85:2444-2448. https://doi.org/10.1073/pnas.85.8.2444

The search database, Caudoviricetes_aa2nt.fas can be obtained from caudocog. Caudoviricetes_aa2nt.fas must be put into the "src" directroy.

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
```
nohup caudoscan -i input_contigs_fasta_format.fas -o output_diractory -t number_of_threads >temp.log 2>&1 &
```

