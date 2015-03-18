## run_analysis.R
## Michal Bebjak
## March 18, 2015
## analyze and tidy data from the UCI HAR Dataset

## From the course project description:
## You should create one R script called run_analysis.R that does the following: 
## 1.Merges the training and the test sets to create one data set.
## 2.Extracts only the measurements on the mean and standard deviation for each measurement. 
## 3.Uses descriptive activity names to name the activities in the data set
## 4.Appropriately labels the data set with descriptive variable names. 
## 5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## included in github folder:
## 1) run_analysis R script, 2) a ReadMe markdown document, 3) a Codebook markdown document, 4) a tidy data text file

## Add the plyr library (will need it for the mapvalues function)
library(plyr)

## Step 1: Read in the data
## use the read.table() function to read in the data for the test, training, and label data sets

## test data
print("Reading in test data...")
test_data <- read.table("./UCI HAR Dataset/test/X_test.txt")
test_ylabels <- read.table("./UCI HAR Dataset/test/Y_test.txt")
test_subject <- read.table("./UCI HAR Dataset/test/subject_test.txt")
print("Dimensions of test data: x, y, and subject tables:")
print(dim(test_data)) ## 2947x561
print(dim(test_ylabels)) ## 2947x1
print(dim(test_subject)) ##2947x1

## train data
print("Reading in training data...")
train_data <- read.table("./UCI HAR Dataset/train/X_train.txt")
train_ylabels <- read.table("./UCI HAR Dataset/train/Y_train.txt")
train_subject <- read.table("./UCI HAR Dataset/train/subject_train.txt")
print("Dimensions of train data: x, y, and subject tables:")
print(dim(train_data)) ## 7352x561
print(dim(train_ylabels)) ## 7352x1
print(dim(train_subject)) ## 7352x1

## activity data
print("Reading in activity labels and features...")
activity_label <- read.table("./UCI HAR Dataset/activity_labels.txt")
features <- read.table("./UCI HAR Dataset/features.txt")
print("Dimensions of activity labels and features:")
print(dim(activity_label)) ## 6x2
print(dim(features)) ## 561x1

## tidy up the the labels for readability by eliminating brackets and underscores
features <- gsub("\\()", "", features$V2)
activity_label <- activity_label$V2
activity_label <- tolower(activity_label)
activity_label <- sub("_", " ", activity_label)

## make column (y) names more easily identifiable by renaming them
names(test_data) <- features 
names(train_data) <- features
names(test_ylabels) <- "activity" 
names(train_ylabels) <- "activity"
names(test_subject) <- "subject" 
names(train_subject) <- "subject"

## Step 2: merge train and test data

## rbind the train data after the test data
merged_data <- rbind(test_data, train_data)
print("Merged data table dimensions:")
print(dim(merged_data)) ## 10299x561

## Step 3: extract only the columns containing st.dev. and mean

## extract only the column positions of the st.dev. and mean values
mean_stdev_cols <- grep("mean|std", names(merged_data))

## create blank data frames with identifiers
test_dataframe <- data.frame(test_ylabels, test_subject)
train_dataframe <- data.frame(train_ylabels, train_subject)
tidy_data <- rbind(test_dataframe, train_dataframe)
print("Tidy data frame dimensions:")
print(dim(tidy_data)) ## 10299x81

## add the stdev/mean cols to a new data frame
for (each in mean_stdev_cols){
  tidy_data <- cbind(tidy_data, merged_data[each])
}

## Step 4: label the data with activity labels

## add in acivity labels labels using mapvalues
tidy_data$activity <- mapvalues(tidy_data$activity, from = levels(factor(tidy_data$activity)), to = activity_label)

## Step 5: create a new tidy data set

## create a new tidy data frame (called tidy_means) with averages for activities and subjects
tidy_means <- aggregate(tidy_data, list(tidy_data$subject, tidy_data$activity), mean)
print("Tidy data frame with averages and st.devs dimensions:")
print(dim(tidy_means)) ## 180x81 (6 activities x 30 participants x 81 variables tracked)

## tidy up column names after aggregation
tidy_means$subject <- NULL 
tidy_means$activity <- NULL
names(tidy_means)[1] <- "subject" 
names(tidy_means)[2] <- "activity"

## write the tidy dataframe into a file of the same name
write.table(file = "tidy_means.txt", x = tidy_means, row.names = FALSE)
print("Successfully wrote and saved file tidy_means.txt to the current working directory.")