# 39.READING LARGE CSV FILE WITH R
# Using data.table library 
install.packages("data.table")
library(data.table)
yyy = fread("C:\\Users\\kavya\\Downloads\\groups.csv", header = TRUE)
# Using bigmemory library
install.packages("bigmemory")
library(bigmemory)
y <- read.big.matrix("C:\\Users\\kavya\\Downloads\\groups.csv", type = "integer", header=TRUE)
dim(y)
# coerce a big.matrix to a matrix
yy= as.matrix(y)
yy
