library(stringr)

# reading all the data
xtrain <- read.table("UCI HAR Dataset\\train\\X_train.txt",header=FALSE)
xtest <- read.table("UCI HAR Dataset\\test\\X_test.txt",header=FALSE)
xall <- rbind(xtrain,xtest)

subjecttrain <- read.table("UCI HAR Dataset\\train\\subject_train.txt",header=FALSE)
subjecttest <- read.table("UCI HAR Dataset\\test\\subject_test.txt",header=FALSE)
subjectall <- rbind(subjecttrain,subjecttest)

ytrain <- read.table("UCI HAR Dataset\\train\\Y_train.txt",header=FALSE)
ytest <- read.table("UCI HAR Dataset\\test\\Y_test.txt",header=FALSE)
yall <- rbind(ytrain,ytest)

features <- read.table("UCI HAR Dataset\\features.txt",header=FALSE)
activity <- read.table("UCI HAR Dataset\\activity_labels.txt",header=FALSE)

#getting only mean or std feature positions
meanOrstd <- str_detect(features$V2, "-mean()") | str_detect(features$V2, "-std()")

# Only retaining mean or std features in observation and naming columns using feature name
xall <- xall[,meanOrstd]
colnames(xall) <- features[meanOrstd,]$V2

# add subject
xall$subject <- subjectall$V1

# add activity with descriptive activity names
xall$activity <- sapply(yall$V1,function(x) activity[x,]$V2)

# do aggregation
tidydata <- aggregate(. ~ activity + subject, data = xall, mean)

# write tidy data
write.table(tidydata,file="tidydata.txt", row.name=FALSE)
