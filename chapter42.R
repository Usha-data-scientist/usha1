# 42.CARET PACKAGE IMPLEMENTATION IN R

install.packages("C50")
library(C50)
install.packages("ROCR")
library(ROCR)
install.packages("caret")
library(caret)
install.packages("plyr")
library(plyr)
install.packages("doMC")
library(doMC)                # error here
require(doMC)


registerDoMC(cores = 5)
trainIndex <- createDataPartition(data[,1], p = .6, list = FALSE, times = 1)
dev <- data[ trainIndex,]
val  <- data[-trainIndex,]
cvCtrl <- trainControl(method = "repeatedcv", number =10, repeats =3, classProbs = TRUE)
grid <- expand.grid(.model = "tree", .trials = c(1:100), .winnow = FALSE)

set.seed(825)
tuned <- train(dev[, -1], dev[,1], method = "C5.0", metric = "ROC",
               tuneGrid = grid, trControl = cvCtrl)
set.seed(825)
tuned <- train(dev[, -1], dev[,1], method = "C5.0", metric = "ROC",
               tunelength = 10, trControl = cvCtrl)
varImp(tuned$finalModel , scale=FALSE)
plot(varImp(tuned$finalModel))
RocImp <- filterVarImp(x = dev[, -1], y = dev[,1])
RocImp
# Seeing result
tuned

# Seeing Parameter Tuning
trellis.par.set(caretTheme())
plot(tuned, metric = "ROC")

# Seeing final model result
print(tuned$finalModel)

#Summaries of C5.0 Model
summary(tuned$finalModel)

# variable Importance
C5imp(tuned$finalModel, metric="usage")

#Scoring
val1 = predict(tuned$finalModel, val[, -1], type = "prob")
