## README

### What does the `run_analysis.R` do?

As the instructions demand, the script `run_analysis.R` does 7 things:

* Read in the training and test data, assign them to `train_dat` and `test_dat` respectively, each including 3 parts:
    * the feature virable data from file`X_train.txt` or `X_test.txt`
    * the subject from file `subject_train.txt` or `subject_test.txt`
    * the activities (a integer between 1 to 6) from file `y_train.txt` or `y_test.txt`
    
        > Note: I had been wondering whether I should read in the raw data in folders `train` and `test`, and finally give up. It is not that it is hard to do so, but the feature variables are computed base on them, and it seems not necessary to get them in. The instructions did not make it very clear at this point, and I am not sure if I am right or wrong.

* Merge the training and the test sets to create one data set `all_dat`
* Extract only the measurements on the mean and standard deviation for each measurement and generate another data set `mean_std_dat`
* Use descriptive activity names got from file `activity_labels.txt` to name the activities in the data set `mean_std_dat`
* Labels the data set `mean_std_dat` with descriptive variable names, i.e., `subject`, `activity`, and the names from file `features.txt`  
* Create a second, independent tidy data set `tidy_dat` with the average of each variable for each activity and each subject
* Output `tidy_dat` to local disk file `tidy_dat.txt`

### How does `run_analysis.R` do its jobs?

* read the training data from 3 files: `train/X_train.txt`,`train/y_train.txt`, and `train/subject_train.txt`, then column bind them to `train_dat`
* read the test data the same way, i.e., from files: `test/X_test.txt`, `test/y_test.txt`, and `test/subject_test.txt`, then column bind them  to `test_dat`
* row bind `train_dat` and `test_dat` to `all_dat`
* in order to extract the measurements on the mean and standard deviation, read in `feature_names` from file `features.txt`, then use `grep` to get the index vector. Here,  we should shift each index right by 2, because the first 2 columns of `all_dat` are `subject` and `activity`, followed by 561 feature variables we want to apply the indices with. After subsetting, we got `mean_std_dat`
* to name the activities of `mean_std_dat` with descriptve names, read in the activity names from file `activity_labels.txt`, and then merge `mean_std_dat` with the activity names. That will append a new column to `mean_std_dat` with activity names, so we should remove the original activity column which are only integers 
* for the sake of labeling the variables in `mean_std_dat` with descriptive variable names, generate the name vetors with the names of the first and last columns being `subject` and `activity`, and others being extracted from feature names by using `grep`
* to generate a new data set whith the average of each variable for each subject on each activity, I used `data.table`. It is simple and consice with just on line:

        `mean_std_dat[, lapply(.SD, mean), by = .(subject, activity)]`

where `.SD` refers to all the columns except the group columns `subject` and `activity`
* finally, write the result `tidy_dat` to file `tidy_dat.txt`

### How to run `run_analysis.R`?

`run_analysis.R` should be put in the same folder with files `activity_labels.txt`, `features.txt` and folders `train`, `test`. You can kick it off with:

        `source("run_analysis.R")`