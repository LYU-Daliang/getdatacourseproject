## CodeBook

### Variables

In the tidy data set `tidy_dat`, there are 68 variables. They are the measurements on the mean or standard deviation for each measurement of the feature variables, plus 2 variables `sbuject` and `activity`.

        "subject"
        "activity"
        "tBodyAcc-mean()-X"
        "tBodyAcc-mean()-Y"
        "tBodyAcc-mean()-Z"
        "tBodyAcc-std()-X"
        "tBodyAcc-std()-Y"
        "tBodyAcc-std()-Z"
        "tGravityAcc-mean()-X"
        "tGravityAcc-mean()-Y"
        "tGravityAcc-mean()-Z"
        "tGravityAcc-std()-X"
        "tGravityAcc-std()-Y"
        "tGravityAcc-std()-Z"
        "tBodyAccJerk-mean()-X"
        "tBodyAccJerk-mean()-Y"
        "tBodyAccJerk-mean()-Z"
        "tBodyAccJerk-std()-X"
        "tBodyAccJerk-std()-Y"
        "tBodyAccJerk-std()-Z"
        "tBodyGyro-mean()-X"
        "tBodyGyro-mean()-Y"
        "tBodyGyro-mean()-Z"
        "tBodyGyro-std()-X"
        "tBodyGyro-std()-Y"
        "tBodyGyro-std()-Z"
        "tBodyGyroJerk-mean()-X"
        "tBodyGyroJerk-mean()-Y"
        "tBodyGyroJerk-mean()-Z"
        "tBodyGyroJerk-std()-X"
        "tBodyGyroJerk-std()-Y"
        "tBodyGyroJerk-std()-Z"
        "tBodyAccMag-mean()"
        "tBodyAccMag-std()"
        "tGravityAccMag-mean()"
        "tGravityAccMag-std()"
        "tBodyAccJerkMag-mean()"
        "tBodyAccJerkMag-std()"
        "tBodyGyroMag-mean()"
        "tBodyGyroMag-std()"
        "tBodyGyroJerkMag-mean()"
        "tBodyGyroJerkMag-std()"
        "fBodyAcc-mean()-X"
        "fBodyAcc-mean()-Y"
        "fBodyAcc-mean()-Z"
        "fBodyAcc-std()-X"
        "fBodyAcc-std()-Y"
        "fBodyAcc-std()-Z"
        "fBodyAccJerk-mean()-X"
        "fBodyAccJerk-mean()-Y"
        "fBodyAccJerk-mean()-Z"
        "fBodyAccJerk-std()-X"
        "fBodyAccJerk-std()-Y"
        "fBodyAccJerk-std()-Z"
        "fBodyGyro-mean()-X"
        "fBodyGyro-mean()-Y"
        "fBodyGyro-mean()-Z"
        "fBodyGyro-std()-X"
        "fBodyGyro-std()-Y"
        "fBodyGyro-std()-Z"
        "fBodyAccMag-mean()"
        "fBodyAccMag-std()"
        "fBodyBodyAccJerkMag-mean()"
        "fBodyBodyAccJerkMag-std()"
        "fBodyBodyGyroMag-mean()"
        "fBodyBodyGyroMag-std()"
        "fBodyBodyGyroJerkMag-mean()"
        "fBodyBodyGyroJerkMag-std()"

### Transformations to clean up the data

* complete the training and test data sets by integrating 2 columns: `subject` and `activity`
* merge the training and test data sets to generating a 2-in-1 data set `all_dat`
* subsetting the `all_dat` to only include the measurements of mean and standard deviation (got a new data set `mean_std_dat`)
* name the activities and columns in `mean_std_dat` with descriptive and meaningful names
* calculate the mean of each numeric variable of `mean_std_dat`, store them whith a new data set `tidy_dat`
* sort the data set `tidy_dat` on column `subject`