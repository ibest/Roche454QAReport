##library(ShortRead)
##sffloc <- "/mnt/home/uirig/data/Gustavo_Analysis/sff"

"plotqa" <- 
function(filename){
    removeExt <- function (x) {
        x <- as.character(x)
        x <- basename(sub("(.*)\\.(.*)$", "\\1", x))
        return(gsub(".", "-", x, fixed=TRUE))
    }
    fa <- read.DNAStringSet(filename,format="fasta")
    ac <- alphabetByCycle(fa,alphabet=c("A","C","T","G","N"))
    ac.reads <- apply(ac,2,sum)
    acf <- sweep(ac,MARGIN=2,FUN="/",STATS=apply(ac,2,sum))
    ac.width <- width(fa)


    pdf(paste(removeExt(filename),"-QA.pdf",sep=""),width=10,height=7.5,pointsize=8,title=paste("Quality Assurance for",removeExt(filename)) )
    par(mfrow=c(2,1))
    matplot(cbind(t(acf),ac.reads/ac.reads[1]),col=c("green","blue","black","red","brown","black"),type="l",lty=1,xlab="Read Length", main="Sequence Distribution")
    hist(ac.width,breaks=200,xlab="Read Length", main="Histogram of Read Length")
    dev.off()
}

##fastafiles <- dir(sffloc,patter="fasta$",full.names=T)
##sapply(fastafiles,plotqa)






