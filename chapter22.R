# 22.joining/merging with R
# creating two tables df1 and df2
df1 <- data.frame(ID = c(1, 2, 3, 4, 5),
                  w = c('a', 'b', 'c', 'd', 'e'),
                  x = c(1, 1, 0, 0, 1),
                  y=rnorm(5),
                  z=letters[1:5])
df1
df2 <- data.frame(ID = c(1, 7, 3, 6, 8),
                  a = c('z', 'b', 'k', 'd', 'l'),
                  b = c(1, 2, 3, 0, 4),
                  c =rnorm(5),
                  d =letters[2:6])
df2
# inner join
df3 = merge(df1, df2, by ="ID")
df3
df3 = merge(df1, df2, by.x ="ID", by.y="ID")
df3
# left join
df4 = merge(df1, df2, by ="ID", all.x = TRUE)
df4
# right join
df5 = merge(df1, df2, by ="ID", all.y = TRUE)
df5
# full join
df6 = merge(df1, df2, by ="ID", all = TRUE)
df6
# cross join
df7 = merge(df1, df2, by = NULL)
df7
# sql joins
install.packages("sqldf")
library(sqldf)
df9 = sqldf('select df1.*, df2.* from df1 left join df2 on df1.ID = df2.ID')
df9
