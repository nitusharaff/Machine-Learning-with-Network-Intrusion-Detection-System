colnames(train) <- c("Duration",  "Protocol_type", "Service", "Flag", "Src_bytes", "Dst_bytes", "Land", "Wrong_fragment", "Urgent", "Hot" ,"Num_failed_logins", "Logged_in", "Num_compromised", "Root_shell", "Su_attempted", "Num_root", "Num_file_creations", "Num_shells", "Num_access_files", "Num_outbound_cmds", "Is_hot_login", "Is_guest_login", "Count", "Srv_count", "Serror_rate", "Srv_serror_rate", "Rerror_rate", "Srv_rerror_rate", "Same_srv_rate", "Diff_srv_rate", "Srv_diff_host_rate", "Dst_host_count", "Dst_host_srv_count", "Dst_host_same_srv_rate", "Dst_host_diff_srv_rate", "Dst_host_same_src_port_rate", "Dst_host_srv_diff_host_rate", "Dst_host_serror_rate", "Dst_host_srv_serror_rate", "Dst_host_rerror_rate", "Dst_host_srv_rerror_rate", "Attacks")

top15 <- data.frame(train$Srv_count ,train$Same_srv_rate, train$Count, train$Flag, train$Dst_host_diff_srv_rate,
                      train$Dst_host_srv_diff_host_rate , train$ Dst_host_rerror_rate, train$Src_bytes , train$Dst_host_serror_rate , train$Num_compromised ,
                      train$Dst_host_same_src_port_rate, train$Dst_host_count, train$Protocol_type, train$Wrong_fragment, train$Rerror_rate, train$Attacks) 

top15$train.Protocol_type<-match(top15$train.Protocol_type, unique(top15$train.Protocol_type))
top15$train.Flag<-match(top15$train.Flag, unique(top15$train.Flag))
top15$train.Attacks<-match(top15$train.Attacks, unique(top15$train.Attacks))
top15$train.Attacks <- top15$train.Attacks-1

dt = (sample(nrow(top15), nrow(top15)*.7))
trainset<-top15[dt,]

testset<-top15[-dt,]

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


