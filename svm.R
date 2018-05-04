train= read.csv("nslkddtrain19.csv" )
library(e1071)

# load the libraries
library(caret)
library(klaR)
index <- 1:nrow(train)
testindex <- sample(index, trunc(length(index)/3))
testset <- train[testindex,]
trainset <- train[-testindex,]

#Both for the SVM and the partitioning tree (via rpart()), we fit the model and
#try to predict the test set values:
## svm

svm.model <- svm(as.factor(Attacks)~., data = trainset, probability=TRUE, cost = 100, gamma = 1)

svm.pred <- predict(svm.model, testset)
confusionMatrix(svm.pred, testset$Attacks)
write.csv(svm.pred, file = "nslkddtest19.csv") 
