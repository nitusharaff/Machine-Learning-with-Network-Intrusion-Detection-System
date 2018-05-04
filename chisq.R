library(mlbench)
library(FSelector)

 library(rpart)
 data(train1, package="mlbench")

train= read.csv("nslkddtrain.csv" )


weights <- chi.squared(Attacks~., train)
print(weights)
subset <- cutoff.k(weights, 25)
f <- as.simple.formula(subset, "Attacks")
print(f)

