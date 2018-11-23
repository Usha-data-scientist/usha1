# 14.transpose data with R 

# Sample Data

data <- read.table(text="X Y    Z
                   ID12   2012-06    566
                   ID1    2012-06  10239
                   ID6    2012-06    524
                   ID12   2012-07   2360
                   ID1    2012-07   13853
                   ID6    2012-07    2352
                   ID12   2012-08   3950
                   ID1    2012-08   14738
                   ID6    2012-08   4104",header=TRUE)
if (!require(reshape2)){
  install.packages('reshape2')
  library(reshape2)
}
install.packages("reshape2")
library(reshape2)

# Transform Long to Wide Format
mydt = dcast(data,X~Y,value.var = "Z")
# More than 1 ID Variable
library(reshape2)
# Convert Wide Format Data to Long Format
# sample data
mydata = read.table(text= "Year Semiyear Product  Income                    
                            1     1      productA  13324
                            1     2      productA  14245
                            1     1      productB  12456
                            1     2      productB  34267
                            2     1      productA  16754
                            2     2      productA  267854
                            2     1      productB  213456
                            2     2      productB  43256
                                        ", header=TRUE)

xx=dcast(mydata, Year + Semiyear ~ Product,  value.var = "Income")
xx
dcast(mydata, Year ~ Product, value.var = "Income")
dcast(mydata, Year ~ Product, fun.aggregate = sum, value.var = "Income")
