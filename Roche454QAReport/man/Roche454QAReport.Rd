\name{Roche454QAReport}
\Rdversion{1.1}
\alias{Roche454QAReport}
\title{QA report from Roche 454 post image processing. 
}
\description{
These functions provide a method for creating, viewing and removing QA 
reports on an experiment run on *.fna and *.qual files
}
\usage{
Roche454QAReport(directory, output = "pdf", outdir = file.path(getwd(), 
"Roche454QAReport"), overwrite = FALSE, repName)
}
\arguments{
  \item{directory}{The location of the *.fna and *.qual files of 
interest.  What files are you creating the report for?}
  \item{output}{Type of output wanted, currently only pdf is supported.}
  \item{outdir}{ The directory (or folder) where output will be 
directed.}
  \item{overwrite}{Whether an existing report, with the same name, 
should be overwritten.}
  \item{repName}{A character string indicating the name of the report. }
}
\details{NA}
\value{}
\references{}
\author{Zev N. Kronenberg, Matt Settles}
\note{NA}
\seealso{}

\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.


}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{Roche}
\keyword{454} 
\keyword{QA}
