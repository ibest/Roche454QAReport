Roche454QAReport <-
function(directory, output = "pdf",
    outdir = file.path(getwd(), "Roche454QAReport"), overwrite = FALSE,
     repName) {
   
    if(missing(repName) )
        repName = basename(directory)


    if( !file.exists(file.path(directory,"454QualityFilterMetrics.csv")))
        stop("Unknown Directory Type")

    if( !file.exists(outdir) )
        if( !dir.create(outdir)) 
            stop("could not create output directory")
   
   outdir = file.path(outdir, repName)
    if( file.exists(outdir) )
       if( overwrite )
           unlink(outdir, recursive=TRUE)
       else
           stop("report already exists")

    if( !dir.create(outdir))
        stop("could not create report directory")

    cd = setwd(outdir)
    on.exit(setwd(cd))

    fastafiles <- dir(directory,pattern="fna$",full.names=T)
    nReg <- length(fastafiles)
    removeExt <- function (x) {
        x <- as.character(x)
        x <-basename(sub("(.*)\\.(.*)$", "\\1", x))
        return(gsub(".", "-",x, fixed=TRUE))
    }
    plotNames <- paste(removeExt(fastafiles),"-QA.pdf",sep="")
    sapply(fastafiles,plotqa)

    QALatex = paste("\\begin{figure}[tp]",
        "\\begin{center}",
        paste("\\includegraphics{", plotNames, "}", sep=""),
        "\\caption{\\label{fig:QA}QA plots.}",
        "\\end{center}\\end{figure}", sep=" \n", collapse="\n\n")


   qaFilterTable <- genFilterTable(directory)

   tab1 = xtable(qaFilterTable, label="table1", caption=paste(
      "Roche Quality Filter Metrics",".", sep=""))
   
   tcon = textConnection("tab1", "w", local=TRUE)
   print(tab1, file=tcon, include.rownames=TRUE, include.colnames=FALSE,)
   close(tcon)
   TAB1 = paste(tab1, collapse="\n")


   ##write the LaTeX
#   texTemp = "/mnt/home/zev/454QaReport/trunk/R_scripts/roche454QATemplate.tex"
#   texTemp = "/home/msettles/CodeProjects/454QA/trunk/R_scripts/roche454QATemplate.tex"
   texTemp = system.file("Templates/roche454QATemplate.tex",package="roche454QAReport")

   #get version numbers and sessionInfo
   pkVers =  packageDescription("roche454QAReport")$Version
   #pkVers = "1.0.0"
   sessInfo = paste(toLatex(sessionInfo()), collapse="\n")

   symVals = c( repName=gsub("_","-",repName), numRegions=nReg, TABLE1=TAB1, 
        QAPLOTS=QALatex, rocheQAVer=pkVers, sessionInfo=sessInfo)

   outFile = file.path(outdir, paste(repName, ".tex", sep=""))

   copySubstitute(texTemp, outFile, symbolValues = symVals)

   ##fix directory structure for latex/win32
g
   if(.Platform$OS.type == "windows")
     outFile = shortPathName(outFile)

   ##set up call to pdflatex and run it twice for x-refs
   syscall = paste("pdflatex", outFile)
   syscall = paste("bibtex", repName)
   syscall = paste("pdflatex", outFile)
   system(syscall)



}

