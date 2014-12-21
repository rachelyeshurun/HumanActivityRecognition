#Code Book for tidy data

####The Data
The raw data is from a study of human activity. The values are from the recordings of 30 subjects performing activities of daily living while carrying a waist-mounted smartphone with embedded inertial sensors.

This is the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphone#

The raw data for this analysis was downloaded here:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

####The transformation
The original data consisted of several files where the machine learning training data was separate from the test data.

For the purposes of this analysis, the data was combined, then reduced to fewer variables and summarized.

The data was cleaned up using a R script: run_analysis.R which does the following:

1. Merges the training and the test sets to create one data set.

2. Extracts only the measurements on the mean and standard deviation for each measurement. 

3. Appropriately label the data set with descriptive variable names.

4. Uses descriptive activity names to name the activities in the data set

5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

####The Variables
There are 68 variables in this data set:

1. activity.name  - one of 6 possible categories: WALKING,WALKING_UPSTAIRS,WALKING_DOWNSTAIRS,SITTING,STANDING,LAYING

2. subject - numerical identification of each subject. Range is 1 through 30.

3. .. 68  tBodyAcc-mean()-X, tBodyAcc-mean()-Ym tBodyAcc-mean()-Z etc. See below for complete list of names.

From the original data which had 561 measurements,  only measurements on the mean and standard deviation were analysed. 

These variables were chosen by selecting from the original variable names only those with 'mean()' or 'std()' in their name.

Then the average of each variable for each subject and each activity (30*6=180) was taken. These averages are the values in variables 3-183

#####Variables 3-68
tBodyAcc-mean()-X, tBodyAcc-mean()-Ym tBodyAcc-mean()-Z tGravityAcc-mean()-X (dbl), tGravityAcc-mean()-Y (dbl),
  tGravityAcc-mean()-Z (dbl), tBodyAccJerk-mean()-X (dbl), tBodyAccJerk-mean()-Y
  (dbl), tBodyAccJerk-mean()-Z (dbl), tBodyGyro-mean()-X (dbl), tBodyGyro-mean()-Y
  (dbl), tBodyGyro-mean()-Z (dbl), tBodyGyroJerk-mean()-X (dbl),
  tBodyGyroJerk-mean()-Y (dbl), tBodyGyroJerk-mean()-Z (dbl), tBodyAccMag-mean()
  (dbl), tGravityAccMag-mean() (dbl), tBodyAccJerkMag-mean() (dbl),
  tBodyGyroMag-mean() (dbl), tBodyGyroJerkMag-mean() (dbl), fBodyAcc-mean()-X (dbl),
  fBodyAcc-mean()-Y (dbl), fBodyAcc-mean()-Z (dbl), fBodyAccJerk-mean()-X (dbl),
  fBodyAccJerk-mean()-Y (dbl), fBodyAccJerk-mean()-Z (dbl), fBodyGyro-mean()-X (dbl),
  fBodyGyro-mean()-Y (dbl), fBodyGyro-mean()-Z (dbl), fBodyAccMag-mean() (dbl),
  fBodyBodyAccJerkMag-mean() (dbl), fBodyBodyGyroMag-mean() (dbl),
  fBodyBodyGyroJerkMag-mean() (dbl), tBodyAcc-std()-X (dbl), tBodyAcc-std()-Y (dbl),
  tBodyAcc-std()-Z (dbl), tGravityAcc-std()-X (dbl), tGravityAcc-std()-Y (dbl),
  tGravityAcc-std()-Z (dbl), tBodyAccJerk-std()-X (dbl), tBodyAccJerk-std()-Y (dbl),
  tBodyAccJerk-std()-Z (dbl), tBodyGyro-std()-X (dbl), tBodyGyro-std()-Y (dbl),
  tBodyGyro-std()-Z (dbl), tBodyGyroJerk-std()-X (dbl), tBodyGyroJerk-std()-Y (dbl),
  tBodyGyroJerk-std()-Z (dbl), tBodyAccMag-std() (dbl), tGravityAccMag-std() (dbl),
  tBodyAccJerkMag-std() (dbl), tBodyGyroMag-std() (dbl), tBodyGyroJerkMag-std() (dbl),
  fBodyAcc-std()-X (dbl), fBodyAcc-std()-Y (dbl), fBodyAcc-std()-Z (dbl),
  fBodyAccJerk-std()-X (dbl), fBodyAccJerk-std()-Y (dbl), fBodyAccJerk-std()-Z (dbl),
  fBodyGyro-std()-X (dbl), fBodyGyro-std()-Y (dbl), fBodyGyro-std()-Z (dbl),
  fBodyAccMag-std() (dbl), fBodyBodyAccJerkMag-std() (dbl), fBodyBodyGyroMag-std()
  (dbl), fBodyBodyGyroJerkMag-std() (dbl)