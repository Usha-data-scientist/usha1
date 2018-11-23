# 20.apply function on rows
# sample data
data = read.table(text="
X Y Z
                  6 5 0
                  6 3 NA
                  6 1 5
                  8 5 3
                  1 NA 1
                  8 7 2
                  2 0 2", header=TRUE)
# calculate max values across rows
apply(data, 1, max)
apply(data, 1, max, na.rm = TRUE)
# calculate mean values across rows
apply(data, 1, mean)
apply(data, 1, mean, na.rm = TRUE)
apply(data == 0, 1, sum, na.rm= TRUE)
apply(data > 5, 1,  sum, na.rm= TRUE)
df = data[apply(data, 1, mean, na.rm = TRUE)>=4,]
helper = apply(data, 1, function(x){any(is.na(x))})
df2 = data[!helper,]
df2
df3 = apply(data,1, function(x) length(unique(na.omit(x))))
df3
