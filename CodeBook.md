Course Project Code Book

Source of the original data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Original description: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The attached R script (run_analysis.R) performs the following to clean up the data:

a.Reads test data in 9 data frames
b.Creates two new category variables for each data frame (created in a) with type (test) and feature (eg.body_acc_x or body_gyro_y or total_acc_z etc)
c.Creates a single test data frame by merging all the above 9 test data sets read in (a) and modified in (b)
d.Reads train data in 9 data frames
e.Creates two new category variables for each data frame (created in d) with type (train) and feature (eg.body_acc_x or body_gyro_y or total_acc_z etc)
f.Creates a single train data frame by merging all the above 9 test data sets read in (d) and modified in (e)
g.Merges the train data set (created in (c)) and the test set(created in (f)) to create one data set.
h. Uses the data frame created in (g) to extract the mean for each measurement to 18 (9 test & 9 train) separate data frames for each activity(test or train) and each feature(eg.body_acc_x or body_gyro_y or total_acc_z etc)
i.Renames the measurement data frame variables (eg.as average_test_body_acc_x) for each of the 18 data frames created in (h)
j. creates a single data frame by merging all the 18 data frames created in (h) and modified in (i); this is written to Merged1.txt file
k. Uses the data frame created in (g) to extract the standard deviation(SD) for each measurement to 18 (9 test & 9 train) separate data frames for each activity(test or train) and each feature(eg.body_acc_x or body_gyro_y or total_acc_z etc)
l.Renames the measurement data frame variables (eg.as SD_test_body_acc_x) for each of the 18 data frames created in (k)
m. creates a single data frame by merging all the 18 data frames created in (k) and modified in (l); this is written to Merged2.txt file


