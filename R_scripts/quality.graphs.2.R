library(ShortRead)
path<-RochePath(".")
raw.data<-read454(path)


#split quality out of raw.data
qual<-quality(raw.data)
#split fasta out of raw.data
fasta<-sread(raw.data)


#lengths of reads
read.length<-width(fasta)


#histogram of read lengths
plot(table(width(fasta))) 

#grab largest read length
max.read.length<-max(read.length)

#sum read quality for each read
sum.quality<-alphabetScore(qual)

#mean quality
mean.quality<-sum.quality/read.length

#create data.frame
avg.qual.tab<-as.data.frame(cbind(read.length, mean.quality))

#create histogram of quality data distribution 
pdf("histofqualitydist.pdf")
hist(avg.qual.tab$mean.quality, xlab="Average Quality Across Entire 
Read", main="Distribution of Mean Quality of Each Read")
dev.off()


#creat a mean,sd of the means for each read 
ag.qual.mean<-aggregate(avg.qual.tab$mean.quality, 
list(avg.qual.tab$read.length), mean)
ag.qual.sd<-aggregate(avg.qual.tab$mean.quality, 
list(avg.qual.tab$read.length), sd)
ag.qual.usd<-ag.qual.mean$x+ag.qual.sd$x
ag.qual.lsd<-ag.qual.mean$x-ag.qual.sd$x

#quality vs read lenght
pdf("qualvslength.pdf")
plot(ag.qual.mean$Group.1, ag.qual.mean$x, xlab="read length", 
ylab="average quality across entire read", main="Avg Quality vs Length", 
ylim=c(10,41), cex=0.1)
a<-lines(ag.qual.mean$Group.1, ag.qual.usd, lty="dashed", col="red")
b<-lines(ag.qual.mean$Group.1, ag.qual.lsd, lty="dashed", col="red")

#legend fixings
lab<- c("1 standard deviation")
lab<- c("one std. dev.")
legend(700,40,pch="-", col="red",lab)

dev.off()


#quality over each base
qual.counts.alphabet<-alphabetByCycle(qual)

#subset just the relevant data i.e quality 1-40, removing other 
#characters used by alphabetByCycle 
#Matt double check I got the right stuff
qual.counts.alphabet<-qual.counts.alphabet[2:(2+40),]

#convert counts to quality values
qual.val<-c(0:40)

#why are there warnings????
actval<-function(x){x*qual.val}
base.qual<-apply(qual.counts.alphabet,2,actval) 

mean.base.qual<-colSums(base.qual)/colSums(qual.counts.alphabet)

tmean.base.qual


ma.qual.val<-matrix(rep(qual.val, times=length(mean.base.qual)), ncol=length(mean.base.qual))
sd.partial<-(sweep(-ma.qual.val, 2, mean.base.qual, "+"))^2*qual.counts.alphabet
sd.base.qual<-colSums(sd.partial)/(colSums(qual.counts.alphabet)-1)
#plot
usd.base.qual<-

plot(mean.base.qual, cex=.1)




