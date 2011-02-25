#create a histogram of read lengths broken up into groups by quality
#I really like this one.

length.hist.include.quality<-function(y){

PHRED.BREAKS<-NULL

for (x in 1:nrow(y)){
if(y[x,2] <= 30) results<-c("below 30")
	else if (y[x,2] > 30 && y[x,2] < 32) results<-c("30-32") 
	else if (y[x,2] > 32 && y[x,2] < 34) results<-c("32-34") 
	else if (y[x,2] > 34 && y[x,2] < 36) results<-c("32-34") 
	else if (y[x,2] > 36 && y[x,2] < 38) results<-c("36-38") 
	else if (y[x,2] > 38 && y[x,2] < 40) results<-c("38-40") 
	else if (y[x,2] > 40) resutls<-c("above 40")

PHRED.BREAKS<-c(PHRED.BREAKS,results)

}

temp.data<-cbind(y, PHRED.BREAKS)
levels(temp.data$PHRED.BREAKS) <- c("below 30","30-32","32-34","34-36","36-38","38-40","above 40") 
read.lenght.qual<-ggplot(temp.data, aes(x=read.length, fill=PHRED.BREAKS)) + geom_bar() + scale_x_continuous("read lengths")  
}

the.plot<-length.hist.include.quality(avg.qual.tab)
pdf("~/Desktop/hist.bar.pdf")
the.plot
dev.off()
