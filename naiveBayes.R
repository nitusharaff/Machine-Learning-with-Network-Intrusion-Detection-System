

now <- Sys.time()
now
model <- naiveBayes(as.factor(train.Attacks) ~ ., data = trainset)
again<- Sys.time()
again
timetaken<- again-now
timetaken
pred <- predict(model, testset)

testset$train.Attacks <- as.factor( testset$train.Attacks)

confusionMatrix(pred, testset$train.Attacks)


