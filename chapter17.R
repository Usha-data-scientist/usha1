# 17.error handling in R
install.packages("randomForest")

mtry <- try(tuneRF(dt[, -3], dat3[,3], ntreeTry=100, stepFactor=1.5,improve=0.01))
if (!inherits(mtry, "try-error")) {
  best.m <- mtry[mtry[, 2] == min(mtry[, 2]), 1]
  rf <- randomForest(ID~.,data=dt, mtry=best.m, importance=TRUE, ntree=1000)
} else {
  rf <- randomForest(ID~.,data=dt, importance=TRUE, ntree=1000)
}  # error here
