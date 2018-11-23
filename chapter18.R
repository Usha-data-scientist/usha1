# 18.converting a factor in to integer
# create a factor variable
a <- factor(c(2, 4, 3, 3, 4))
str(a)
a2 = as.numeric(as.character(a))
str(a2)
