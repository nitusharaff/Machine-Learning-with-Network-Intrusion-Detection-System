library(mlbench)
library(FSelector)
train= read.csv("D:\\sem 6\\pattern classification\\kddtrain.csv" )
sapply(train$Protocol_type, function(x) length(unique(x)))

train$Protocol_type= as.numeric(train$Protocol_type)

train$Service= as.numeric(train$Service)
train$Flag= as.numeric(train$Flag)
train$Attacks= as.numeric(train$Attacks)
write.csv(train, "D:\\sem 6\\pattern classification\\kddtrain.csv", row.names=FALSE)

train= read.csv("D:\\sem 6\\pattern classification\\kddtest.csv" )
sapply(train$Protocol_type, function(x) length(unique(x)))

train$Protocol_type= as.numeric(train$Protocol_type)

train$Service= as.numeric(train$Service)
train$Flag= as.numeric(train$Flag)
train$Attacks= as.numeric(train$Attacks)
write.csv(train, "D:\\sem 6\\pattern classification\\kddtest.csv", row.names=FALSE)

