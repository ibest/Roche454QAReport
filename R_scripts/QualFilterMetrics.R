genFilterTable<- function(directory){

    if( 
!file.exists(file.path(directory,"454QualityFilterMetrics.csv")))
       stop("454QualityFilterMetrics.csv does not exist")

    Filter <- read.table(file.path(directory,"454QualityFilterMetrics.csv"),sep=",", skip=5, 
    header <- FALSE,stringsAsFactors=F)
    regions <-grep("region", Filter[[1]])
    names <- Filter[[1]][regions[1]:regions[2]-1]
    Filter<-matrix(Filter[[2]], ncol=length(regions))
    rownames(Filter) <- names
    #write.table(Filter, 
    #file="qualityfiltermetrics.csv",sep=",",row.names=T,col.names=F,quote=F)
    return(Filter)


}
