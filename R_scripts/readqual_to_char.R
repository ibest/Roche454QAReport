library(Biobase)
library(Biostrings)
install.packages("ascii")
71
library(ascii)
qualdata <- read.BStringSet(file.path("1.TCA.454Reads.qual"))
qualunlisted<-unlist(qualdata)
qualcharacter<-as.character(qualunlisted)
qualsplit<-strsplit(qualcharacter, split=">")
qualdatamatrix<-as.matrix(qualsplit)


### Matt, too slow
library(Biobase)
library(Biostrings)
qual <- readFASTA("1.TCA.454Reads.qual")
qual.seq <- lapply(strsplit(subListExtract(qual,"seq",simplify=T),split=" +"),as.integer)
names(qual.seq) <- subListExtract(qual, "desc", TRUE)
qual <- BStringSet(sapply(qual.seq, function(elt) rawToChar(as.raw(elt+33))))

