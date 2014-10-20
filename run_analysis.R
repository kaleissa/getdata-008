load_package("lubridate") # for easy date-handling
load_package("dplyr")



## read data tables features.txt and activity_labels.txt
features <- read.table("UCI HAR Dataset/features.txt") ## table contains 563 col. names
labels <- read.table("UCI HAR Dataset/activity_labels.txt") ## table contains activity names

## Read train.txt set and apply colnames.
test <- read.table("UCI HAR Dataset/test/X_test.txt",col.names = features$V2)

## Read test.txt set and apply colnames.
train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$V2)


## read activity code data in y_test and y_train
testSubject <- read.table("UCI HAR Dataset/test/subject_test.txt")
trainSubject <- read.table("UCI HAR Dataset/train/subject_train.txt")







## read activity code data in y_test and y_train
testActivity <- read.table("UCI HAR Dataset/test/y_test.txt")
trainActivity <- read.table("UCI HAR Dataset/train/y_train.txt")

## Convert V1 to Chr in trainActivity and testActivity
trainActivity$V1 <- as.character(trainActivity$V1)
testActivity$V1 <- as.character(testActivity$V1)

## use revalue() from plyr library
trainActivity$Activity<-revalue(trainActivity$V1, c("1"="WALKING", "2"="WALKING_UPSTAIRS", 
                            "3"="WALKING_DOWNSTAIRS","4"="SITTING",
                            "5"="STANDING","6"="LAYING"))

## Add activity name to activity code coloum in  test and train.



# combine test and train into a table called data
data <- rbind(test,train)

