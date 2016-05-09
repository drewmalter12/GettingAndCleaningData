
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names.
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


library(plyr)

x_test <- read.table("~/Documents/Coursera/2-Getting_and_Cleaning_Data/test/X_test.txt", quote="\"", comment.char="")
y_test <- read.table("~/Documents/Coursera/2-Getting_and_Cleaning_Data/test/y_test.txt", quote="\"", comment.char="")
subject_test <- read.table("~/Documents/Coursera/2-Getting_and_Cleaning_Data/test/subject_test.txt", quote="\"", comment.char="")

x_train <- read.table("~/Documents/Coursera/2-Getting_and_Cleaning_Data/train/X_train.txt", quote="\"", comment.char="")
y_train <- read.table("~/Documents/Coursera/2-Getting_and_Cleaning_Data/train/y_train.txt", quote="\"", comment.char="")
subject_train <- read.table("~/Documents/Coursera/2-Getting_and_Cleaning_Data/train/subject_train.txt", quote="\"", comment.char="")


## step 1 

## x data set
x_data <- rbind(x_test, x_train)

## y data set
y_data <- rbind(y_test, y_train)


## subject data set
subject_data <- rbind(subject_test, subject_train)

## step 2

features <- read.table("~/Documents/Coursera/2-Getting_and_Cleaning_Data/features.txt", quote="\"", comment.char="")

# get only columns with mean() or std() in their names
mean_and_std <- grep("-(mean|std)\\(\\)", features[, 2])

# subset the desired columns
x_data <- x_data[, mean_and_std]

# correct the column names
names(x_data) <- features[mean_and_std, 2]

## step 3

activity_names <- read.table("~/Documents/Coursera/2-Getting_and_Cleaning_Data/activity_labels.txt", quote="\"", comment.char="")

# update values with correct activity names
y_data[, 1] <- activity_names[y_data[, 1], 2]

# correct column name
names(y_data) <- "activity"

# step 4

# correct column name
names(subject_data) <- "subject"

# bind all the data in a single data set
all_data <- cbind(x_data, y_data, subject_data)

# step 5

averages_data <- ddply(all_data, .(subject, activity), function(x) colMeans(x[, 1:66]))

write.table(averages_data, "averages_data.txt", row.name=FALSE)
head(averages_data)
