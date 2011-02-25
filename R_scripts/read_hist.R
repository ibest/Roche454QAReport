#this function requires read.length.data.frame

read.length.hist<-function(y){

hist<-qplot(read.length, data=y, geom="histogram")
hist<-hist + geom_histogram(colour = "blue", fill = "white") + scale_x_continuous("read lenght")

}

the.plot<-read.length.hist(read.length.dataframe)
pdf("~/Desktop/read.length.hist")
the.plot
dev.off()
