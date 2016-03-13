Course Project Code Book

Source of the original data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Human Activity Recognition Using Smartphones Data Set:

Data Set Information:

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 
The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain 

Attribute Information:
For each record in the dataset it is provided: 
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

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
n. creates a single data frame Tidydataset by merging Merged1(created in (j)) and Merged2 (created in (m)) files


