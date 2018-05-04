library(mlbench)
library(FSelector)

 library(rpart)
 data(train1, package="mlbench")
 ## split data into a train and test set
train= read.csv("D:\\sem 6\\pattern classification\\nslkddtrain.csv" )

#train= read.csv("D:\\san fransisco\\train.csv" )
#data(train)
weights <- chi.squared(Attacks~., train)
print(weights)
subset <- cutoff.k(weights, 25)
f <- as.simple.formula(subset, "Attacks")
print(f)

