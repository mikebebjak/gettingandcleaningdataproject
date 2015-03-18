## README
The purpose of the run_analysis.R script in this repository is to perform a tidy data analysis on a dataset that tracked 30 volunteers' movements using a smartphone they wore around the waste. The details of the project can be found here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
The script merges, trims, and aggregates the relevant data in the datasets provided to show just the means and standard deviations of the measurements for each subject performing each of the 6 activities. This tidied up measurement table is then uploaded to a text file. Codebook.md describes in more detail how the script works and there is also fairly extensive documentation in the script itself.
To obtain the tidy means table, perform the following steps:
* Download the .zip file with the data from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and unzip it into your current working directory (you can find out what that is by typing in getwd() in the RStudio command prompt).
* Download the run_analysis.R script in this repository and place it in the same working directory
* Run the run_analysis.R script by typing in source('run_analysis.R') in your RStudio command line
* The tidy data set will be created in the same working directory and given the name tidy_means.txt
* You can view the tidy data set using Wordpad or (carefully) in R by using the print(head(tidy_means.txt)) command. The dimensions of the final data file are 180 x 83 fields so it is rather large.