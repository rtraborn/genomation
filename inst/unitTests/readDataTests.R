
# test for readGeneric function
test_readGeneric = function()
{
  
  tab.test1=system.file('tests/tab.test1', package='genomation')
  
  #1. test regular bed input
  r1 = readGeneric(tab.test1)
  g1 = GRanges(c('chr1','chr1'), IRanges(c(1,5), c(10,15)))
  checkIdentical(g1, r1)
  
  #2. test strand
  r2 = readGeneric(tab.test1, strand=4)
  g2 = GRanges(c('chr1','chr1'), IRanges(c(1,5), c(10,15)), strand=c('+','-'))
  checkIdentical(g2, r2)
  
  #3. all metadata colums
  r3 = readGeneric(tab.test1, strand=4, keep.all.metadata=TRUE)
  g3 = GRanges(c('chr1','chr1'), 
               IRanges(c(1,5), c(10,15)), 
               strand=c('+','-'),
               V5=as.integer(c(15,20)),
               V6=as.integer(c(20,25)))
  checkIdentical(g3,r3)
  
  #4. all named metadata colums
  r4 = readGeneric(tab.test1, strand=4, meta.col=list(score1=5, score2=6))
  g4 =  GRanges(c('chr1','chr1'), 
                IRanges(c(1,5), c(10,15)), 
                strand=c('+','-'),
                score1=as.integer(c(15,20)),
                score2=as.integer(c(20,25)))
  checkIdentical(g4,r4)
  
  #5. selected metadata columns
  r5 = readGeneric(tab.test1, strand=4, meta.cols=list(score1=6))
  g5 =  GRanges(c('chr1','chr1'), 
                IRanges(c(1,5), c(10,15)), 
                strand=c('+','-'),
                score1=as.integer(c(20,25)))
  checkIdentical(g5,r5)

  #6. test whether it can read a file containing a header
  tab.test2=system.file('tests/tab.test2', package='genomation')
  r6 = readGeneric(tab.test2)
  g6 = GRanges(c('chr1','chr1'), IRanges(c(1,5), c(10,15)))
  checkIdentical(g6,r6)
  
  #7. header=TRUE, keep.all.metadata=TRUE
  r7 = readGeneric(tab.test2,strand=4, header=TRUE, keep.all.metadata=TRUE)
  

  #8. test whether it can read a file with permutted columns
  tab.test3=system.file('tests/tab.test3', package='genomation')
  r7 = readGeneric(tab.test3, chr=5, start=3, end=4, strand=6, 
                   meta.col=c(score1=1, score2=2))
  g7 =  GRanges(c('chr1','chr1'), 
                IRanges(c(1,5), c(10,15)), 
                strand=c('+','-'),
                score1=as.integer(c(15,20)),
                score2=as.integer(c(20,25)))
  checkIdentical(g7,r7)
}