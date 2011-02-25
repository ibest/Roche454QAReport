runtime<-readLines("454RuntimeMetricsAll.csv")
runtime <- runtime[-which(runtime=="")]
regions1<-grep("region", runtime)
data <- matrix(runtime[regions1[1]:length(runtime)], ncol=length(regions1))
data <- as.list(as.data.frame(data))

data2 <- split(runtime[regions1[1]:length(runtime)],rep(1:length(regions1),each=diff(c(regions1,length(runtime)+1))))

data3 <- lapply(data2, function(x) {

     ncom <- sapply(gregexpr(',',x),length)
     keyseq <- grep("keySequence",x)
     sequ <- grep("sequence,all",x)
     if(sequ > 1) error("RUNTIMEMETRICSALL: equence,all occurs more than once")

     sequ_data <- x[sequ:(keyseq[2]-1)]
     all_else <- x[-(sequ:(keyseq[2]-1))]
   ### PARSE AND PLOT SEQU_DATA -- MATT WILL DO
     ncom <- sapply(gregexpr(',',sequ_data),length)
     names <- sequ_data[ncom==1]
     names <- sub("sequence,","",names)
     obj <- matrix(unlist(strsplit(sequ_data[ncom==3],split=",")),ncol=4,byrow=T)
   #### TABLE AND/OR PLOT ALL ELSE - ZEV
	
})
	

