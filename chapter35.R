# 35.R : CONVERTING MULTIPLE NUMERIC VARIABLES TO FACTOR
# Converting Numeric Variables to Factor
# Using Column Index Numbers
names <- c(1:3,5)
mydata
mydata <- data.frame(mydata,names)
mydata[,names] <- lapply(mydata[,names] , factor)
str(mydata)
# Using Column Names
mydata
names1 <- c('Credit' ,'Balance')
gender <- c(1,2,1,2)
mydata <- data.frame(mydata,names1,gender)
mydata
mydata[,gender] <- lapply(mydata[,gender] , factor) # error here
str(mydata)
# Converting all variables
col_names <- names(mydata)
mydata[,col_names] <- lapply(mydata[,col_names] , factor)
# Converting all numeric variables
mydata[sapply(mydata, is.numeric)] <- lapply(mydata[sapply(mydata, is.numeric)], as.factor)
col_names <- sapply(mydata, function(col) length(unique(col)) < 4)

mydata[ , col_names] <- lapply(mydata[ , col_names] , factor)

