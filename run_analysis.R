#R script for Coursera Getting and Cleaning Data Course Project
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3. Appropriately label the data set with descriptive variable names.
# 4. Uses descriptive activity names to name the activities in the data set
# 5. From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.
 
library(dplyr)
#First download and unzip files
if (!file.exists("./dataset.zip")) {
  dataset_url <- "http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(dataset_url, "dataset.zip")
  unzip("dataset.zip", exdir = "data")
}

#Now read files into datasets

#list of features
featuresData <- read.table("./data/UCI HAR Dataset/features.txt")

#Links the class labels with their activity name
activityLabelData <- read.table("./data/UCI HAR Dataset/activity_labels.txt")

#the training data
trainingData <- read.table("./data/UCI HAR Dataset/train/X_train.txt")

#the labels for the training data
trainingLabelData <- read.table("./data/UCI HAR Dataset/train/y_train.txt")

#the testing data
testData <- read.table("./data/UCI HAR Dataset/test/X_test.txt")

#the labels for the testing data
testLabelData <- read.table("./data/UCI HAR Dataset/test/y_test.txt")

#Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30
subjectTrainData <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")
subjectTestData <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")

#Just for debugging ...
#dim(activityLabelData)
#dim(featuresData)
#dim(subjectTrainData)
#dim(subjectTestData)
#dim(trainingData)
#dim(testData)
#dim(trainingLabelData)
#dim(testLabelData)


#name the columns
names(subjectTrainData) <-  c("subject")
names(subjectTestData)  <-  c("subject")

#name features, making them unique for later compatibility with select()
names(trainingData)  <-  make.unique(as.character(featuresData[,2]))
names(testData)  <-  make.unique(as.character(featuresData[,2]))

#name activity
names(trainingLabelData) <-  c("activity")
names(testLabelData) <-  c("activity")
names(activityLabelData) <-  c("activity", "activity.name")

trainingRows <- cbind(subjectTrainData,trainingLabelData,trainingData)
testRows <- cbind(subjectTestData,testLabelData,testData)

#Now just combine: training rows first, then test rows
combinedData <- rbind(trainingRows, testRows)

#extract only the measurements on the mean and standard deviation for each measurement.
selectedCombinedData <- select(combinedData, subject, activity, contains('mean()'),contains('std()'))

#Uses descriptive activity names to name the activities in the data set
mergedData <- merge(activityLabelData,selectedCombinedData)
mergedData <- select(mergedData, -activity)


grouped <- group_by(mergedData, subject, activity.name)
summarized <- summarise_each(grouped, funs(mean))

summarized

#for uploading to coursera
#write.table(summarized, file="tidy.txt", row.name=FALSE) 

