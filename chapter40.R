# 40.CREATE DUMMY COLUMNS FROM CATEGORICAL VARIABLE

# new dummy columns from a categorical variable.
DF <- data.frame(strcol = c("A", "A", "B", "F", "C", "G", "C", "D", "E", "F"))
for(level in unique(DF$strcol)){
  DF[paste("strcol", level, sep = "_")] <- ifelse(DF$strcol == level, 1, 0)}
DF
