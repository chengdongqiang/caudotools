args = commandArgs(trailingOnly=TRUE)
output<-args[1]
f1<-paste(output,"/all_mash_dist.output.out.out",sep="")
f2<-paste(output,"/all_mash_dist.output.out.out.clusters",sep="")
f3<-paste(output,"/all_mash_dist.output.out.out.clustersname",sep="")

#my case
column <-read.table(file=f1, header = TRUE, sep = "\t", check.names = FALSE)
d<-xtabs(dist ~ id1 + id2, column)
d <- as.dist(d)
hc <- hclust(d, method = "single")
dend <- as.dendrogram(hc)
#plot(dend)
#clu<-cutree(hc,h = 0.05)
clu<-cutree(hc,h = 0.2)
#clu is an vector
cluname<-names(clu)
write(clu, file=f2, ncolumns=1, sep = "\t")
write(cluname, file=f3, ncolumns=1, sep = "\t")

