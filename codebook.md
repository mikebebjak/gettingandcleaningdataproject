## The Data Source

The data for this project comes from the data set entitled Human Activity Recognition Using Smartphones Dataset

The authors are: Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws

The description of this data set (which is intended to be used in machine learning applications) can be found at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
The data set itself is available at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## The Data

The README file in the original .zip file with the data has detailed information on what the data represents and how it has been gathered.
Essentially, the data was collected from 30 volunteers who performed 6 different activities while wearing a Samsung Galaxy S phone around their waste. The data was randomly split into training and test sets where 70% of the participants were selected for training data and 30% for test data (for the purposes of machine learning). The project used the smartphone's built-in accelerometer and gyroscope to capture 3-axial accelaration and 3-axial angular velocity at 50 Hz.
The files are as follows:
In the test directory:
* subject_test.txt: contains subject number for test data
* X_test.txt: contains vector information for the test data
* Y_test.txt: contains an activity number for the test data
In the train directory:
* subject_train.txt, X_train.txt, Y_train.txt - same as above but for the train volunteers
In the main directory:
* activity_labels.txt: the names of the different activities
* features.txt: the names of the vector values for the train and test sets
* features_info.txt: explanation of the features variables, what they mean, and how they were obtained

## The R Analysis

First, the data are loaded into R in data tables corresponding to the different .txt files with the data: y and x tables for test and train, features, activity labels, and subjects.
The columns were renamed and unnecessary elements like brackets and underscores were eliminated to simplify the identifiers.
Then, the test and train data are merged into merged_data using rbind, cleaned up into a new data frame called tidy_data and then aggregated with just the averages and standard deviations of the data set into tidy_means. The tidy data set with means and st devs are then uploaded to a file called tidy_means.txt in the working directory.

## Summarized data

The resultant tidy table has 81 different values for each subject for each position. These are summarized in the document features_info.txt but include means and st deviations of all the main measurements such as body acceleration, gravity acceleration, gyro magnitude and jerk, etc. All of these are feature vectors and measured in m/s^2 or m/s. Frequency is in Hz and time in s.


