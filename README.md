## **Caudotools: identification of tailed phage Caudoviricetes viruses contigs from error-prone Nanopore long reads**

### **Introduction**
Tailed bacteriophages, also known as phages, are viruses that share a common ancestry and classified into the class Caudoviricetes. Long-read sequencing technology is greatly accelerating phage discoveries. The error-prone long reads often result in a high rate of open reading frame shifts, causing virtual protein translation failures. Previous phage identification software, which relies on protein Hidden Markov Model searches, will lose its effectiveness. Caudoscan has been developed to identify phage contigs through nucleotide homologous searches and calculation of a window-based score following the Wilson score interval method. Caudoscan score of 0.3 served as a judgement threshold. If a contig had a caudoscan score greater than 0.3, it was categorized as a phage contig. Simulations using error-prone long reads of 40 kb and 20 kb showed that the F1 score for caudoscan reached 0.95 and 0.90, respectively.

### **Prerequisites**
Caudoscan mainly implemented the fasta36 tool for DNA sequence similarity searching. The program fasta36 must be installed and made available in the system’s PATH. The FASTA programs was by W.R. Pearson and D.J. Lipman (1988), "Improved tools for biological sequence comparison", PNAS 85:2444-2448. https://doi.org/10.1073/pnas.85.8.2444

The search database, Caudoviricetes_aa2nt.fas can be obtained from caudocog.

### **Install**
```
git clone https://github.com/chengdongqiang/caudoscan.git
```
Add caudoscan path to your environment variable $PATH. Edit file ~/.bash_profile and add one line at end of the file:

export PATH=$PATH:/caudoscan/path
```
source ~/.bash_profile
```

### **Usage**
```
nohup caudoscan -i input_contigs_fasta_format.fas -o output_diractory -t number_of_threads >temp.log 2>&1 &
```

