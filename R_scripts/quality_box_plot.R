# THERE IS A PROBLEM WITH THE ASSIGNMENT OF BREAKS
box.plot.quality<-function(y){

PHRED.BREAKS<-NULL

for (x in 1:nrow(y)){
if(y[x,2] <= 30){ results<-c("0-30")
	}
	else if (y[x,2] > 30 && y[x,2] < 32){
 		results<-c("30-32")
	} 
	else if (y[x,2] > 32 && y[x,2] < 34){
		results<-c("32-34")
	} 
	else if (y[x,2] > 34 && y[x,2] < 36){
 		results<-c("34-36")
	} 
	else if (y[x,2] > 36 && y[x,2] < 38){
 		results<-c("36-38")
	} 
	else if (y[x,2] > 38 && y[x,2] < 40){
 		results<-c("38-40")
	} 
	else if (y[x,2] > 40){
		 resutls<-c("40+")
	}	

PHRED.BREAKS<-c(PHRED.BREAKS,results)

}

temp.data<-cbind(y, PHRED.BREAKS)
the.plot <- ggplot(temp.data, aes(PHRED.BREAKS, mean.quality, fill=PHRED.BREAKS)) + stat_boxplot()
}

the.plot<-box.plot.quality(avg.qual.tab)
pdf("~/Desktop/box.plot.quality.pdf")
the.plot
dev.off()
