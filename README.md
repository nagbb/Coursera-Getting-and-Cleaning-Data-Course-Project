# Coursera-Getting-and-Cleaning-Data-Course-Project
Getting and Cleaning Data Course Project:

The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.

One of the most exciting areas in all of data science right now is wearable computing - see for example this article http://www.insideactivitytracking.com/data-science-activity-tracking-and-the-battle-for-the-worlds-top-sports-brand/ . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data has been collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.

The following are the instructions for running the R script:

1. Download the zip file from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

2. Unzip the zip file, whereupon a folder named "UCI HAR Dataset" will be created

3. Copy the run_analysis.R file inside the  "UCI HAR Dataset" folder (with path say C:\Users\yourname\Documents\R\UCI HAR Dataset)

4. Set the working directory of RStudio using the command: setwd("C:\Users\yourname\Documents\R\UCI HAR Dataset")

5. Run the script in RStudio using command: source("run_analysis.R")

6. On completion of script running the following three files will be generated in the "UCI HAR Dataset" folder:

(i) Merged.txt
Merged data set comprising of both the training and the test sets.

(ii) Merged1.txt
Independent tidy data set with the average of each variable for each activity and each subject

(iii) Merged2.txt
Independent tidy data set with the standard deviation (SD) of each variable for each activity and each subject
