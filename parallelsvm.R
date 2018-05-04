train= read.csv("nslkddtrain19.csv" )
library(e1071)

# load the libraries
library(caret)
library(klaR)
library(parallelSVM)
index <- 1:nrow(train)
testindex <- sample(index, trunc(length(index)/3))
testset <- train[testindex,]
trainset <- train[-testindex,]
#Both for the SVM and the partitioning tree (via rpart()), we fit the model and
#try to predict the test set values:
## svm

svm.model <- parallelSVM(Attacks ~ ., data = trainset,type = "C-classification", numberCores = 8, samplingSize = 0.2,probability = TRUE, gamma=0.1, cost = 10)
svm.pred <- predict(svm.model, testset)
write.csv(svm.pred, file = "nslkddtest19parallel.csv") 
confusionMatrix(svm.pred,testset$Attacks)  

