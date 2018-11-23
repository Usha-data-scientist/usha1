# 15.loops with R 
# sample data set
dat <- data.frame(x = c(1:5,NA),
                  z = c(1, 1, 0, 0, NA,0),
                  y = 5*c(1:6))
# Maximum value of each row
apply(dat, 1, max, na.rm= TRUE)
apply(dat, 2, max, na.rm= TRUE)
# Lapply Function
lapply(dat, function(x) median(x, na.rm = TRUE))
# Apply a custom function
lapply(dat, function(x) x + 1)
# Sapply Function
# Number of Missing Values in each Variable
sapply(dat, function(x) sum(is.na(x)))
# Extract names of all numeric variables in IRIS dataset
colnames(iris)[which(sapply(iris,is.numeric))]
# Lapply and Sapply Together
# sample data
dat <- data.frame(x = c(1:5,NA),
                  z = c(1, 1, 0, 0, NA,0),
                  y = factor(5*c(1:6)))
#  Converting Factor Variables to Numeric
index <- sapply(dat, is.factor)
dat[index] <- lapply(dat[index], function(x) as.numeric(as.character(x)))
# for loop
# Maximum value of each column
x = NULL
for (i in 1:ncol(dat)){
  x[i]= max(dat[i], na.rm = TRUE)}
x
x = vector("double", ncol(dat))
for (i in seq_along(dat)){
  x[i]= max(dat[i], na.rm = TRUE)}
x 
# Split IRIS data based on unique values in "species" variable
for (i in 1:length(unique(iris$Species))) {
  require(dplyr)
  assign(paste("iris",i, sep = "."), filter(iris, Species == as.character(unique(iris$Species)[i])))
}
# Combine / Append Data within LOOP
# Use do.call with rbind
temp =list()
for (i in 1:length(unique(iris$Species))) {
  series= data.frame(Species =as.character(unique(iris$Species))[i])
  temp[[i]] =series
}
output = do.call(rbind, temp)
output
# Standard Looping Technique
dummydt=data.frame(matrix(ncol=0,nrow=0))
temp = function(data, var) {
  for (i in 1:length(unique(data[[var]]))) {
    series= data.frame(Species = as.character(unique(data[[var]]))[i])
    if (i==1) {output = rbind(dummydt,series)}  else {output = rbind(output,series)}
  }
  return(output)}
temp(iris, "Species")
for (i in which(sapply(dat, is.numeric))) {
  dat[is.na(dat[, i]), i] <- median(dat[, i],  na.rm = TRUE)
}
# new columns in Loop
mydata = data.frame(x1=sample(1:100,100), x2=sample(letters,100, replace=TRUE), x3=rnorm(100))
mydata
lst=list()
for (i in which(sapply(mydata, is.numeric))) {
  x.scaled = (mydata[,i] - mean(mydata[,i])) /sd(mydata[,i])
  lst[[i]] = x.scaled
}

names(lst) <- paste(names(sapply(mydata, is.numeric)),"_scaled", sep="")
mydata.scaled= data.frame(do.call(cbind, lst))
# while loop in R
i=1
while(i<7)
{
  if(i%%2==0)
    print(paste(i, "is an Even number"))
  else if(i%%2>0)
    print(paste(i, "is an Odd number"))
  i=i+1
}
# break keyword
for (i in 1:3) {
  for (j in 3:1) {
    if ((i+j) > 4) {
      break    } else {
        print(paste("i=", i, "j=", j))
      }
  }
}
# next keyword
for (i in 1:3) {
  for (j in 3:1) {
    if ((i+j) > 4) {
      next
    } else {
      print(paste("i=", i, "j=", j))
    }
  }
}
