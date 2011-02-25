### genFilterTable generates a table from the 454 quality filter metrics csv
### file, this report contains QA information for both spike in control reads
### and experiment reads
"genFilterTable" <- 
function(directory){

    if( !file.exists(file.path(directory,"454QualityFilterMetrics.csv")))
       stop("454QualityFilterMetrics.csv does not exist")

    Filter <-read.table(file.path(directory,"454QualityFilterMetrics.csv"),sep=",", 
    skip=5, header <- FALSE,stringsAsFactors=F)
    regions <-grep("region", Filter[[1]])
    names <- Filter[[1]][regions[1]:regions[2]-1]
    Filter<-matrix(Filter[[2]], ncol=length(regions))
    Filter<-as.data.frame(cbind(names,Filter))
    return(Filter)
}
