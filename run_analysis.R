## structure of code to download and unzip similar to course material 
## at http://jtleek.com/modules/03_GettingData/03_02_summarizingData/#3


## open lpackages required to process data

library("utils", lib.loc="C:/Program Files/R/R-3.1.1/library")
library("plyr")
library(reshape2)

## Step 1
## Download and unzip original data file
## if Dataset is missing.

if(!file.exists("./UCI HAR Dataset")) {
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="Dataset.zip")
unzip("Dataset.zip") 
}


## Step 2 (read and merge the activity labels data into one table )

## Activity 
## read activity code data in y_test and y_train and Activity Labels
labels <- read.table("UCI HAR Dataset/activity_labels.txt") ## table contains activity names
testActivity <- read.table("UCI HAR Dataset/test/y_test.txt",col.names="Activity")
trainActivity <- read.table("UCI HAR Dataset/train/y_train.txt",col.names="Activity")
## Convert $Activity to Chr in trainActivity and testActivity
testActivity$Activity <- as.character(testActivity$Activity)
trainActivity$Activity <- as.character(trainActivity$Activity)
## use rbind to combine test and train into a table called data
Activity <- rbind(testActivity,trainActivity)
## use revalue() from plyr library
Activity$Activity<-revalue(Activity$Activity, c("1"="WALKING", "2"="WALKING_UPSTAIRS", 
                                                "3"="WALKING_DOWNSTAIRS","4"="SITTING",
                                                "5"="STANDING","6"="LAYING"))
## remove testActivity and trainActivity to conserve ram.
rm(testActivity, trainActivity, labels)


################

## Step 3 (read and merge the subject code data into one table )
## Read subject_test and subject_train
testSubject <- read.table("UCI HAR Dataset/test/subject_test.txt",col.names="Subject") ## table contains 
trainSubject <- read.table("UCI HAR Dataset/train/subject_train.txt",col.names="Subject") ## table contains 
## use rbind to combine test and train into a table called data
Subject <- rbind(testSubject,trainSubject)
## Remove testSubject and trainSubject to conserve ram
rm(testSubject, trainSubject)



###################

## Step 4 (read and merge the measurments contained in the test and train datasets
## labels data into one table )
## Read data tables features.txt and Measurments
features <- read.table("UCI HAR Dataset/features.txt") ## table contains 563 col. names
test <- read.table("UCI HAR Dataset/test/X_test.txt",col.names = features$V2)
train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$V2)
## use rbind to combine test and train into a table called data
data <- rbind(test,train)
## use grepl to get vector of col.names containg means and deviations.
stdmean <- grepl("mean|std", features$V2)
## subset data to include only means and standard deviations
data <- data[, stdmean]
## remove test and train to conserve ram.
rm(test, train, features, stdmean)

######################
## Step 5 (use cbind to bind the three datatables created in previous steps to form a single datatable )
## cbind
asData<-cbind(Activity,Subject,data)

## remove testActivity and trainActivity to conserve ram.
rm(Activity,Subject,data)

#############################

## step 6  deals with the getting the final dataset, use melt() and dcast() to produce a
## new dataset containg  180 observations (one for each subject per activity)  
## and 79 columns containing calculated means of the variables. 

meltdata<-melt(asData,c("Subject","Activity"))
tidyData <- dcast(meltdata, Subject + Activity ~ variable, mean)

## step 7 output data.
write.table(tidyData, file = "tidyDataset.txt", row.names = F)
