# 21.drop columns with R
# sample data
set.seed(456)
mydata <- data.frame(a=letters[1:5], x=runif(5,10,50), y=sample(5), z=rnorm(5))
# Delete column by name
df = subset(mydata, select = -c(x,z) )
drop <- c("x","z")
df = mydata[,!(names(mydata) %in% drop)]
df
# Drop columns by column index numbers
df <- mydata[ -c(1,3:4) ]
# keep column by name
keeps <- c("x","z")
df = mydata[keeps]
df = subset(mydata, select = c(x,z))
df <- mydata[c(2,4)]
# Keep or Delete columns with dplyr package
install.packages("dplyr")
library(dplyr)
mydata2 = select(mydata, -1, -3:-4)
mydata2 = select(mydata, -a, -x, -y)
mydata2 = select(mydata, -c(a, x, y))
mydata2 = select(mydata, -a:-y)
mydata2
mydata2 = select(mydata, a, y:z)
# Keep / Drop Columns by Name Pattern
mydata = read.table(text="
INC_A SAC_A INC_B ASD_A
2 1 5 12
3 4 2 13
", header=TRUE)
mydata1 = mydata[,grepl("^INC",names(mydata))]
mydata1
mydata2 = mydata[,!grepl("^INC",names(mydata))]
mydata2
mydata12 = mydata[,grepl("_A$",names(mydata))]
mydata12
mydata22 = mydata[,!grepl("_A$",names(mydata))]
mydata22
mydata32 = mydata[,grepl("*S",names(mydata))]
mydata32
mydata33 = mydata[,!grepl("*S",names(mydata))]
mydata33
# Keep / Drop Column Function
KeepDrop = function(data=df,cols="var",newdata=df2,drop=1) {
  # Double Quote Output Dataset Name
  t = deparse(substitute(newdata))
  
  # Drop Columns
  if(drop == 1){
    newdata = data [ , !(names(data) %in% scan(textConnection(cols), what="", sep=" "))]}
  
  # Keep Columns
  else {
    newdata = data [ , names(data) %in% scan(textConnection(cols), what="", sep=" ")]}
  assign(t, newdata, .GlobalEnv)
}
KeepDrop(data=mydata,cols="a x", newdata=dt, drop=0)
KeepDrop(data=mydata,cols="a x", newdata=dt, drop=1)
