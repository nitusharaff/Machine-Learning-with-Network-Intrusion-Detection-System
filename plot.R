

def plot {

breaks <- c(0, 100, 200, 300,400,600) # times are internally fractions of a day
labels <- c("0-100", "100-200", "200-300", "300-400", "above 400")
counted <- cut(train$train.Count, breaks, labels, include.lowest = TRUE)



train$Attacks[train$Attacks == "back."] <- "DOS"

train$Attacks[train$Attacks == "buffer_overflow."] <- "U2R"
train$Attacks[train$Attacks == "ftp_write."] <- "R2L"
train$Attacks[train$Attacks == "guess_passwd."] <- "R2L"
train$Attacks[train$Attacks == "imap."] <- "R2L"

train$Attacks[train$Attacks == "ipsweep."] <- "Probe"
train$Attacks[train$Attacks == "land."] <- "DOS"
train$Attacks[train$Attacks == "loadmodule."] <- "U2R"
train$Attacks[train$Attacks == "multihop."] <- "R2L"


train$Attacks[train$Attacks == "neptune."] <- "DOS"
train$Attacks[train$Attacks == "nmap."] <- "Probe"
train$Attacks[train$Attacks == "perl."] <- "U2R"
train$Attacks[train$Attacks == "phf."] <- "R2L"

train$Attacks[train$Attacks == "pod."] <- "DOS"
train$Attacks[train$Attacks == "portsweep."] <- "Probe"
train$Attacks[train$Attacks == "satan."] <- "Probe"
train$Attacks[train$Attacks == "smurf."] <- "DOS"


train$Attacks[train$Attacks == "teardrop."] <- "DOS"
train$Attacks[train$Attacks == "warezmaster."] <- "R2L"
train$Attacks[train$Attacks == "rootkit."] <- "U2R"

train$Attacks[train$Attacks == "warezclient."] <- "R2L"
train$Attacks[train$Attacks == "spy."] <- "R2L"

x<-table(train$train.Protocol_type, train$train.Attacks)
x<- as.data.frame(x)
colnames(x) <- c("Protocol","Attacks", "Frequency")
ggplot(x, aes(x=Attacks, ylab="Frequency", y=Frequency, colour=Protocol, group=Protocol)) + geom_line()



t<-table(counted,train$train.Attacks)
t<- as.data.frame(t)
colnames(t) <- c("Age_Group","Trip_Duration", "Frequency")

barplot(t, main="Attacks on number of connections to same destination as host",
        xlab="Attacks",ylab="Frequency", col=c("blue","green","yellow", "red", "orange"),
        legend = rownames(t))


}
