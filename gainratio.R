library(mlbench)
library(FSelector)
train= read.csv("D:\\sem 6\\pattern classification\\nslkddtrain1.csv" )

weights <- information.gain(Attacks~., train)
print(weights)
subset <- cutoff.k(weights, 25)
f <- as.simple.formula(subset, "Attacks")
print(f)


weights <- gain.ratio(Attacks~., train)
print(weights)
subset <- cutoff.k(weights, 25)
f <- as.simple.formula(subset, "Attacks")
print(f)

