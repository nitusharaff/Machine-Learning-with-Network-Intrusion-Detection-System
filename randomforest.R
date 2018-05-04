
library(randomForest)
library(mlbench)
library(caret)





rf_model<-train(train.Attacks~.,data=trainset,method="rf",
                trControl=trainControl(method="cv",number=3),
                prox=TRUE,allowParallel=TRUE)
