## Combine duplicated rows (identified by an ID or rownames). In this example duplicated rows are combined by the mean value, other functions can be used

#Input example
# Gene Val1 Val2  Val3
# A1    4     5     6
# A2    2     4     8
# A3    1     1     1
# A2    4     12    8

#Output example
# Gene Val1 Val2  Val3
# A1    4     5     6
# A2    3     8     8
# A3    1     1     1


vf2=aggregate(vf, by=list(vf$Gene), FUN=mean)
