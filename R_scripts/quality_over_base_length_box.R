quality.over.length<-function(y){

length.breaks<-NULL
organize.list<-NULL

for (x in 1:nrow(y)){
             if (y[x,1] > 0 && y[x,1] < 25){
 		results<-c("0-25")
 		svector<-c(1)
	} 
	else if (y[x,1] > 25 && y[x,1] < 50){
 		results<-c("25-50") 
		svector<-c(2)
	}
	else if(y[x,1] > 50 && y[x,1] < 75){
 		results<-c("50-75") 
		svector<-c(3)
	}
	else if (y[x,1] > 75 && y[x,1] < 100){
		results<-c("75-100") 
		svector<-c(4)
	}
	else if (y[x,1] > 100 && y[x,1] < 125){
		 results<-c("100-125")
		 svector<-c(5)
	}
	else if (y[x,1] > 125 && y[x,1] < 150){
		 results<-c("125-150")
	 	svector<-c(6)
	}
	else if (y[x,1] > 150 && y[x,1] < 175){
		 results<-c("150-175")
		 svector<-c(7)
	}
	else if (y[x,1] > 175 && y[x,1] < 200){
		results<-c("175-200") 	
		svector<-c(8)
	}
	else if (y[x,1] > 200 && y[x,1] < 225){
 		results<-c("200-225")
		svector<-c(9)
	}
	else if (y[x,1] > 225 && y[x,1] < 250){
		results<-c("225-250")
		svector<-c(10)
	}
	else if (y[x,1] > 250 && y[x,1] < 275){
		results<-c("250-275")
		svector<-c(11)
	}
	else if (y[x,1] > 275 && y[x,1] < 300){
 		results<-c("275-300")
		svhector<-c(12)
	}
	else if (y[x,1] > 300 && y[x,1] < 325){
		results<-c("300-325")
		svector<-c(13)
	}

	else if (y[x,1] > 325 && y[x,1] < 350){
 		results<-c("325-350")
		svector<-c(14)
	}
	else if (y[x,1] > 350 && y[x,1] < 375){
	 	results<-c("350-375") 
		svector<-c(15)
	}	
	else if (y[x,1] > 375 && y[x,1] < 400){
	 	results<-c("375-400") 
		svector<-c(16)
	}
	else if (y[x,1] > 400 && y[x,1] < 425){
 		results<-c("400-425")
		svector<-c(17)
	}
	else if (y[x,1] > 425 && y[x,1] < 450){ 
		results<-c("425-450") 
		svector<-c(18)
	}
	else if (y[x,1] > 450 && y[x,1] < 475){
	 	results<-c("450-475")
		svector<-c(19)
	}
	else if (y[x,1] > 475 && y[x,1] < 500){
		results<-c("475-500")
		svector<-c(20)
	}
	else if (y[x,1] > 500){ 
		resutls<-c("500+") 
		svector<-c(21)
	}

length.breaks<-c(length.breaks,results)
organize.list<-c(organize.list,svector)


}

temp.data<-cbind(mean.base.qual, c(1:length(mean.base.qual)),length.breaks,organize.list)
levels(temp.data$length.breaks) <- c("0-25","0-50","50-75","75-100","100-125","125-150","150-175","175-200","200-225","225-250", "250-275","275-300","300-325","325-350", "350-375","375-400","400-425","425-450","450-475","475-500","500+") 
the.plot <- ggplot(temp.data, aes(length.breaks, mean.base.quality, fill = factor(length.breaks))) 
the.plot<-the.plot + geom_boxplot() + scale_x_discrete("length breaks") + scale_y_continuous("average quality of read") 

}
#needs to be killed for the package?
the.plot<-quality.over.length(avg.qual.tab)
pdf("~/Desktop/quality.over.length.pdf", width=17)
the.plot
dev.off()

