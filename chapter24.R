# 24.indexing operators in list in R

dat <- list( str='R', vec=c(1,2,3), bool=TRUE )
a = dat["str"]
class(a)
b = dat[["str"]]
class(b)
c = dat$str
class(b)
dat <- list("usha","anil","devesh")

# extract a list of list
dat1[[c("usha","anil")]] 
dat$usha$anil
