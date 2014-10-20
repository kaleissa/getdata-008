
library("plyr")

## Activity 
## read activity code data in y_test and y_train and Activity Labels
labels <- read.table("UCI HAR Dataset/activity_labels.txt") ## table contains activity names
testActivity <- read.table("UCI HAR Dataset/test/y_test.txt",col.names="Activity")
trainActivity <- read.table("UCI HAR Dataset/train/y_train.txt",col.names="Activity")
## Convert $Activity to Chr in trainActivity and testActivity
testActivity$Activity <- as.character(testActivity$Activity)
trainActivity$Activity <- as.character(trainActivity$Actity)
## use rbind to combine test and train into a table called data
Activity <- rbind(testActivity,trainActivity)
## use revalue() from plyr library
Activity$Activity<-revalue(Activity$Activity, c("1"="WALKING", "2"="WALKING_UPSTAIRS", 
                                                "3"="WALKING_DOWNSTAIRS","4"="SITTING",
                                                "5"="STANDING","6"="LAYING"))
## remove testActivity and trainActivity to conserve ram.
rm(testActivity, trainActivity, labels)

################

## Subject
## Read subject_test and subject_train
testSubject <- read.table("UCI HAR Dataset/test/subject_test.txt",col.names="Subject") ## table contains 
trainSubject <- read.table("UCI HAR Dataset/train/subject_train.txt",col.names="Subject") ## table contains 
## use rbind to combine test and train into a table called data
Subject <- rbind(testSubject,trainSubject)
## Remove testSubject and trainSubject to conserve ram
rm(testSubject, trainSubject)



###################

## Data Measurments 
## Read data tables features.txt and Measurments
features <- read.table("UCI HAR Dataset/features.txt") ## table contains 563 col. names
test <- read.table("UCI HAR Dataset/test/X_test.txt",col.names = features$V2)
train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$V2)
## use rbind to combine test and train into a table called data
data <- rbind(test,train)
## remove test and train to conserve ram.
rm(test, train)
## use grepl to get vector of col.names containg means and deviations.
stdmean <- grepl("mean|std", features$V2)
## subset data to include on means and standard deviations
data <- data[, stdmean]








############################
## use rbind to combine test and train into a table called data
data <- rbind(test,train)

## remove testActivity and trainActivity to conserve ram.
rm(testActivity, trainActivity)

rm(test, train)
rm(features, labels)
rm(Activity,Subject,data)

## cbind
asData<-cbind(Activity,Subject,data)

## use grepl to get vector of col.names containg means and deviations.
## Extract only the measurements on the mean and std
stdmean <- grepl("mean\\(\\)|std\\(\\)", features$V2)
stdmean <- grepl("mean|std", features$V2)
data <- data[, stdmean]


