# 27.R WHICH FUNCTION EXPLAINED
# sample data frame
ls = data.frame( x1 = ceiling(runif(10)*10),
                 x2 = ceiling(runif(10)*10),
                 x3 = runif(10),
                 x4= rep(letters[1:5],2))
# Column number of variable "x4" in ls data set
i=which(names(ls)== "x4")
# Row number in which maximum value of variable "x1" exists
which(ls$x1 == max(ls$x1))
# Row number in which multiple conditions hold true
which(ls$x1 == 7 & ls$x2 == 4)
# Number of cases in which variable x1 is equal to variable x2
length(which(ls$x1 == ls$x2))
# value is common in both the variables
ls[which(ls$x1 == ls$x2),"x1"] 
# Extract names of all the numeric variables
check = which(sapply(ls, is.numeric))
colnames(ls)[check]
