% Generated by roxygen2 (4.1.0): do not edit by hand
% Please edit documentation in R/scoreMatrix.R
\docType{methods}
\name{ScoreMatrix}
\alias{ScoreMatrix}
\alias{ScoreMatrix,GRanges,GRanges-method}
\alias{ScoreMatrix,RleList,GRanges-method}
\alias{ScoreMatrix,character,GRanges-method}
\title{Get base-pair score for bases in each window}
\usage{
ScoreMatrix(target, windows, strand.aware = FALSE, weight.col = NULL,
  is.noCovNA = FALSE, type = "", rpm = FALSE, unique = FALSE,
  extend = 0, param = NULL)

\\S4method{ScoreMatrix}{RleList,GRanges}(target,windows,strand.aware)

\\S4method{ScoreMatrix}{GRanges,GRanges}(target, windows, strand.aware, weight.col, is.noCovNA)

\\S4method{ScoreMatrix}{character,GRanges}(target,windows, strand.aware, type='', rpm=FALSE, unique=FALSE, extend=0, param=NULL)
}
\arguments{
\item{target}{\code{RleList} , \code{GRanges}, a BAM file or a BigWig
to be overlapped with ranges in \code{windows}}

\item{windows}{\code{GRanges} object that contains the windows of interest.
It could be promoters, CpG islands, exons, introns.
However the sizes of windows have to be equal.}

\item{strand.aware}{If TRUE (default: FALSE), the strands of the
windows will be taken into account in the resulting
 \code{ScoreMatrix}.
  If the strand of a window is -, the values of the bins
  for that window will be reversed}

\item{weight.col}{if the object is \code{GRanges} object a numeric column
 in meta data part can be used as weights. This is particularly
useful when genomic regions have scores other than their
coverage values, such as percent methylation, conservation
scores, GC content, etc.}

\item{is.noCovNA}{(Default:FALSE)
if TRUE,and if 'target' is a GRanges object with 'weight.col'
 provided, the bases that are uncovered will be preserved as
 NA in the returned object. This useful for situations where
 you can not have coverage all over the genome, such as CpG methylation
 values.}

\item{type}{if target is a character vector of file paths, then type designates
the type of the corresponding files (bam or bigWig)}

\item{rpm}{boolean telling whether to normalize the coverage to per milion
reads. FALSE by default.}

\item{unique}{boolean which tells the function to remove duplicated reads
based on chr, start, end and strand}

\item{extend}{numeric which tells the function to extend the reads to width=extend}

\item{param}{ScanBamParam object}
}
\value{
returns a \code{ScoreMatrix} object
}
\description{
The funcion produces a base-pair resolution matrix of scores for given equal
width windows of interest. The returned matrix  can be used to
draw meta profiles or heatmap of read coverage or wig track-like data.
The \code{windows} argument can be a predefined region around transcription start sites
or other regions of interest that have equal lengths
The function removes all window that fall off the Rle object -
have the start coordinate < 1 or end coordinate > length(Rle)
The function takes the intersection of names in the Rle and GRanges objects.
On Windows OS the function will give an error if the target is a file in .bigWig format.
}
\examples{
# When target is GRanges
#data(cage)
#data(promoters)
#scores1=ScoreMatrix(target=cage,windows=promoters,strand.aware=TRUE,
#                                weight.col="tpm")

# When target is RleList
#library(GenomicRanges)
#covs = coverage(cage)
#scores2 = ScoreMatrix(target=covs,windows=promoters,strand.aware=TRUE)

# When target is a bam file
# bam.file = system.file('tests/test.bam', package='genomation')
# windows = GRanges(rep(c(1,2),each=2), IRanges(rep(c(1,2), times=2), width=5))
# scores3 = ScoreMatrix(target=bam.file,windows=windows, type='bam')
}
\seealso{
\code{\link{ScoreMatrixBin}}
}

