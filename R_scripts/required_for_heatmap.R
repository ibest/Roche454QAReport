system(paste("grep '^>' *.fna > tmp.txt", sep="\t"))
system(paste("perl /home/jewmanchue/Documents/454_projects/454QaReport/trunk/R_scripts/parse.location.info.pl"))
info<-read.csv("temp2.text", header=TRUE)

library(ggplot2)

d<-ggplot(data=info, aes(xcord,ycord))
d + stat_bin2d(binwidth=c(8,8))


m <- ggplot(data=info[1:332,], aes(x=xcord, y=ycord)) + geom_point() + geom_contour(aes(z=mean.quality))
