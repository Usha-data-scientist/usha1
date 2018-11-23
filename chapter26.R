# 26.CONVERT DATA FROM WIDE TO LONG FORMAT

install.packages("reshape2")
library(reshape2)
# sample data
df = read.table(text= "ID Product1 Product2 Product3 Product4
1 1 NA 1 1
2 1 1 NA 1
3 1 1 NA NA
4 1 1 1 1", header=TRUE)
df
library(reshape2)
x = colnames(df[,-1])
t2 <- melt(df,id.vars = "ID",measure.vars = x , variable.name="Product", value.name="value",na.rm = TRUE)
t2 = t2[order(t2$ID),]
t2
