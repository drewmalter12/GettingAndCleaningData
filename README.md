# Steps for GettingAndCleaningData

1) Merges the training and the test sets to create one data set.

2) Extracts only the measurements on the mean and standard deviation for each measurement.

3) Uses descriptive activity names to name the activities in the data set

4) Appropriately labels the data set with descriptive variable names.

5) From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


# Elements in the Repository:

* Readme.md - This file
* runAnalysis.R - The R script that outputs the file tidyData.txt
* tidyData.txt - The output from the code contained in the R script
* codebook.md - The description of the variables in runAnalysis.R

# Original Data Provided

* features.txt: List of all features.

* activity_labels.txt: List of class labels and their activity name.

* train/X_train.txt: Training set.

* train/y_train.txt: Training labels.

* train/subject_train.txt: IDs of subjects in the training data

* test/X_test.txt: Test set.

* test/y_test.txt: Test labels.

* test/subject_test.txt: IDs of subjects in the testing data


# How the script works

* First the plyr package was installed, which make it useful to split data and do much more with it
* It then reads in all of the provided data files
* rbind is then used to merge the corresponding data sets into one
* The grep function is used to extract the columns with mean() and std() values and forms a new data frame with the "activity_id", the "subject_id" and the mean() and std() columns
* The desired activity names from the y_data are then extracted, and then all of the data is binded together
* Finally, ddply is used to create the tidy data set with the average of each variable for each activity and each subject.
