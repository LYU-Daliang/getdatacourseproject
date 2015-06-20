## this script should be in the same folder with files "activity_labels.txt", 
## "features.txt" and folders "train", "test" 
## setwd("~/work/getdata/UCI HAR Dataset")

## read the training data
train_X <- read.table("train/X_train.txt", header = FALSE)
train_y <- read.table("train/y_train.txt", header = FALSE)
train_subject <- read.table("train/subject_train.txt", header = FALSE)
## combine the "subject", "activity" and 561 feature variables
train_dat <- cbind(train_subject, train_y, train_X)

## read the test data
test_X <- read.table("test/X_test.txt", header = FALSE)
test_y <- read.table("test/y_test.txt", header = FALSE)
test_subject <- read.table("test/subject_test.txt", header = FALSE)
## combine the "subject", "activity" and 561 feature variables
test_dat <- cbind(test_subject, test_y, test_X)

## merge the training and test data
all_dat <- rbind(train_dat, test_dat)

## extract the measurements on the mean and standard deviation
feature_names <- read.table("features.txt", header = FALSE, 
                            colClasses = "character")
## use "grep" to get the index, and shift the indices right by 2, because
## the first 2 columns are "subject" and "activity"
index <- c(1:2, grep("-(mean|std)\\(", feature_names[[2]]) + 2)
mean_std_dat <- all_dat[index]

## name the activities in mean_std_dat with descriptive activity names
act_labels <- read.table("activity_labels.txt", header = FALSE)
mean_std_dat <- merge(mean_std_dat, act_labels, by.x = 2, by.y = 1)
## remove the first column, i.e. "activity", because the "merge" generated 
## a new "activity" column with characters and appended it as the last column
mean_std_dat <- mean_std_dat[-1]

## label the variables in mean_std_dat with descriptive variable names
## the name of the first and last columns should be "subject" and "activity",
## others should be extracted from feature names by using "grep"
var_names <- c("subject", 
               feature_names[[2]][grep("-(mean|std)\\(", feature_names[[2]])], 
               "activity")
names(mean_std_dat) <- var_names

## generate a new data set whith the average of each variable for each subject 
## on each activity
library("data.table")
mean_std_dat <- as.data.table(mean_std_dat)
## with data.table, ".SD" refers to all the comumns except the group columns, 
## in this context, the group columns are "subject" and "activity"
tidy_dat <- mean_std_dat[, lapply(.SD, mean), by = .(subject, activity)]
## the row number of the result is 180, because there are 30 subjects and 
## 6 activities, and I'd like to sort it by "subject"
setorder(tidy_dat, subject)
write.table(tidy_dat, file = "tidy_dat.txt", row.names = FALSE)

## That is all. I had been wondering whether I should merge the raw data in 
## folders "train" and "test", and finally give up. It is not that it is hard 
## to do so, but the feature variables are computed base on them, and it is 
## not necessary to get them in. The instructions did not make it very clear
## at this point, and I am not sure if I am right or wrong.