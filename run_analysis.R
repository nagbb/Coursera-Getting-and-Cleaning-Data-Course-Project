# This R script does the following:

library(dplyr)

#Reading test data in 9 data frames
body_acc_x_test<-read.table("test/Inertial Signals/body_acc_x_test.txt")
body_acc_y_test<-read.table("test/Inertial Signals/body_acc_y_test.txt")
body_acc_z_test<-read.table("test/Inertial Signals/body_acc_z_test.txt")
body_gyro_x_test<-read.table("test/Inertial Signals/body_gyro_x_test.txt")
body_gyro_y_test<-read.table("test/Inertial Signals/body_gyro_y_test.txt")
body_gyro_z_test<-read.table("test/Inertial Signals/body_gyro_z_test.txt")
total_acc_x_test<-read.table("test/Inertial Signals/total_acc_x_test.txt")
total_acc_y_test<-read.table("test/Inertial Signals/total_acc_y_test.txt")
total_acc_z_test<-read.table("test/Inertial Signals/total_acc_z_test.txt")

#3. Uses descriptive activity names to name the activities in the data set
#Creating two new category variables for each data frame with type (test) and feature
body_acc_x_test<-mutate(body_acc_x_test,id=rownames(body_acc_x_test),type=c("test"),feature=c("body_acc_x"))
body_acc_y_test<-mutate(body_acc_y_test,id=rownames(body_acc_y_test),type=c("test"),feature=c("body_acc_y"))
body_acc_z_test<-mutate(body_acc_z_test,id=rownames(body_acc_z_test),type=c("test"),feature=c("body_acc_z"))
body_gyro_x_test<-mutate(body_gyro_x_test,id=rownames(body_gyro_x_test),type=c("test"),feature=c("body_gyro_x"))
body_gyro_y_test<-mutate(body_gyro_y_test,id=rownames(body_gyro_y_test),type=c("test"),feature=c("body_gyro_y"))
body_gyro_z_test<-mutate(body_gyro_z_test,id=rownames(body_gyro_z_test),type=c("test"),feature=c("body_gyro_z"))
total_acc_x_test<-mutate(total_acc_x_test,id=rownames(total_acc_x_test),type=c("test"),feature=c("total_acc_x"))
total_acc_y_test<-mutate(total_acc_y_test,id=rownames(total_acc_y_test),type=c("test"),feature=c("total_acc_y"))
total_acc_z_test<-mutate(total_acc_z_test,id=rownames(total_acc_z_test),type=c("test"),feature=c("total_acc_z"))

#Creating a single test data frame by merging all the above 9 test data sets
Merged_test<-rbind(body_acc_x_test,body_acc_y_test,body_acc_z_test,body_gyro_x_test,body_gyro_y_test,body_gyro_z_test,total_acc_x_test,total_acc_y_test,total_acc_z_test)

#Reading train data in 9 data frames
body_acc_x_train<-read.table("train/Inertial Signals/body_acc_x_train.txt")
body_acc_y_train<-read.table("train/Inertial Signals/body_acc_y_train.txt")
body_acc_z_train<-read.table("train/Inertial Signals/body_acc_z_train.txt")
body_gyro_x_train<-read.table("train/Inertial Signals/body_gyro_x_train.txt")
body_gyro_y_train<-read.table("train/Inertial Signals/body_gyro_y_train.txt")
body_gyro_z_train<-read.table("train/Inertial Signals/body_gyro_z_train.txt")
total_acc_x_train<-read.table("train/Inertial Signals/total_acc_x_train.txt")
total_acc_y_train<-read.table("train/Inertial Signals/total_acc_y_train.txt")
total_acc_z_train<-read.table("train/Inertial Signals/total_acc_z_train.txt")

#3. Uses descriptive activity names to name the activities in the data set
#Creating two new category variables for each data frame with type (train) and feature
body_acc_x_train<-mutate(body_acc_x_train,id=rownames(body_acc_x_train),type=c("train"),feature=c("body_acc_x"))
body_acc_y_train<-mutate(body_acc_y_train,id=rownames(body_acc_y_train),type=c("train"),feature=c("body_acc_y"))
body_acc_z_train<-mutate(body_acc_z_train,id=rownames(body_acc_z_train),type=c("train"),feature=c("body_acc_z"))
body_gyro_x_train<-mutate(body_gyro_x_train,id=rownames(body_gyro_x_train),type=c("train"),feature=c("body_gyro_x"))
body_gyro_y_train<-mutate(body_gyro_y_train,id=rownames(body_gyro_y_train),type=c("train"),feature=c("body_gyro_y"))
body_gyro_z_train<-mutate(body_gyro_z_train,id=rownames(body_gyro_z_train),type=c("train"),feature=c("body_gyro_z"))
total_acc_x_train<-mutate(total_acc_x_train,id=rownames(total_acc_x_train),type=c("train"),feature=c("total_acc_x"))
total_acc_y_train<-mutate(total_acc_y_train,id=rownames(total_acc_y_train),type=c("train"),feature=c("total_acc_y"))
total_acc_z_train<-mutate(total_acc_z_train,id=rownames(total_acc_z_train),type=c("train"),feature=c("total_acc_z"))

#Creating a single train data frame by merging all the above 9 train data sets
Merged_train<-rbind(body_acc_x_train,body_acc_y_train,body_acc_z_train,body_gyro_x_train,body_gyro_y_train,body_gyro_z_train,total_acc_x_train,total_acc_y_train,total_acc_z_train)

#1. Merges the train and the test sets to create one data set.
#Creating a single data frame by merging the test and train data frames and writing to a text file
Merged<-rbind(Merged_test,Merged_train)
write.table(Merged,file="Merged.txt")


# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# Extracts the mean for each measurement to a data frame separately for each activity and each feature
test_body_acc_x<-as.data.frame(colMeans(select(filter(Merged, type=="test" & feature=="body_acc_x"),1:128)))
test_body_acc_y<-as.data.frame(colMeans(select(filter(Merged, type=="test" & feature=="body_acc_y"),1:128)))
test_body_acc_z<-as.data.frame(colMeans(select(filter(Merged, type=="test" & feature=="body_acc_z"),1:128)))
test_body_gyro_x<-as.data.frame(colMeans(select(filter(Merged, type=="test" & feature=="body_gyro_x"),1:128)))
test_body_gyro_y<-as.data.frame(colMeans(select(filter(Merged, type=="test" & feature=="body_gyro_y"),1:128)))
test_body_gyro_z<-as.data.frame(colMeans(select(filter(Merged, type=="test" & feature=="body_gyro_z"),1:128)))
test_total_acc_x<-as.data.frame(colMeans(select(filter(Merged, type=="test" & feature=="total_acc_x"),1:128)))
test_total_acc_y<-as.data.frame(colMeans(select(filter(Merged, type=="test" & feature=="total_acc_y"),1:128)))
test_total_acc_z<-as.data.frame(colMeans(select(filter(Merged, type=="test" & feature=="total_acc_z"),1:128)))

train_body_acc_x<-as.data.frame(colMeans(select(filter(Merged, type=="train" & feature=="body_acc_x"),1:128)))
train_body_acc_y<-as.data.frame(colMeans(select(filter(Merged, type=="train" & feature=="body_acc_y"),1:128)))
train_body_acc_z<-as.data.frame(colMeans(select(filter(Merged, type=="train" & feature=="body_acc_z"),1:128)))
train_body_gyro_x<-as.data.frame(colMeans(select(filter(Merged, type=="train" & feature=="body_gyro_x"),1:128)))
train_body_gyro_y<-as.data.frame(colMeans(select(filter(Merged, type=="train" & feature=="body_gyro_y"),1:128)))
train_body_gyro_z<-as.data.frame(colMeans(select(filter(Merged, type=="train" & feature=="body_gyro_z"),1:128)))
train_total_acc_x<-as.data.frame(colMeans(select(filter(Merged, type=="train" & feature=="total_acc_x"),1:128)))
train_total_acc_y<-as.data.frame(colMeans(select(filter(Merged, type=="train" & feature=="total_acc_y"),1:128)))
train_total_acc_z<-as.data.frame(colMeans(select(filter(Merged, type=="train" & feature=="total_acc_z"),1:128)))

#4. Appropriately labels the data set with descriptive variable names.
# Renames the measurement data frame variables
colnames(test_body_acc_x) <- "average_test_body_acc_x"
colnames(test_body_acc_y) <- "average_test_body_acc_y"
colnames(test_body_acc_z) <- "average_test_body_acc_z"
colnames(test_body_gyro_x) <- "average_test_body_gyro_x"
colnames(test_body_gyro_y) <- "average_test_body_gyro_y"
colnames(test_body_gyro_z) <- "average_test_body_gyro_z"
colnames(test_total_acc_x) <- "average_test_total_acc_x"
colnames(test_total_acc_y) <- "average_test_total_acc_y"
colnames(test_total_acc_z) <- "average_test_total_acc_z"
colnames(train_body_acc_x) <- "average_train_body_acc_x"
colnames(train_body_acc_y) <- "average_train_body_acc_y"
colnames(train_body_acc_z) <- "average_train_body_acc_z"
colnames(train_body_gyro_x) <- "average_train_body_gyro_x"
colnames(train_body_gyro_y) <- "average_train_body_gyro_y"
colnames(train_body_gyro_z) <- "average_train_body_gyro_z"
colnames(train_total_acc_x) <- "average_train_total_acc_x"
colnames(train_total_acc_y) <- "average_train_total_acc_y"
colnames(train_total_acc_z) <- "average_train_total_acc_z"

# 5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
Merged1<-cbind(test_body_acc_x,test_body_acc_y,test_body_acc_z,test_body_gyro_x,test_body_gyro_y,test_body_gyro_z,test_total_acc_x,test_total_acc_y,test_total_acc_z,train_body_acc_x,train_body_acc_y,train_body_acc_z,train_body_gyro_x,train_body_gyro_y,train_body_gyro_z,train_total_acc_x,train_total_acc_y,train_total_acc_z)
write.table(Merged1,file="Merged1.txt")

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# Extracts the SD for each measurement to a data frame separately for each activity and each feature
SD_test_body_acc_x<-as.data.frame(apply((select(filter(Merged, type=="test" & feature=="body_acc_x"),1:128)),2,sd))
SD_test_body_acc_y<-as.data.frame(apply((select(filter(Merged, type=="test" & feature=="body_acc_y"),1:128)),2,sd))
SD_test_body_acc_z<-as.data.frame(apply((select(filter(Merged, type=="test" & feature=="body_acc_z"),1:128)),2,sd))
SD_test_body_gyro_x<-as.data.frame(apply((select(filter(Merged, type=="test" & feature=="body_gyro_x"),1:128)),2,sd))
SD_test_body_gyro_y<-as.data.frame(apply((select(filter(Merged, type=="test" & feature=="body_gyro_y"),1:128)),2,sd))
SD_test_body_gyro_z<-as.data.frame(apply((select(filter(Merged, type=="test" & feature=="body_gyro_z"),1:128)),2,sd))
SD_test_total_acc_x<-as.data.frame(apply((select(filter(Merged, type=="test" & feature=="total_acc_x"),1:128)),2,sd))
SD_test_total_acc_y<-as.data.frame(apply((select(filter(Merged, type=="test" & feature=="total_acc_y"),1:128)),2,sd))
SD_test_total_acc_z<-as.data.frame(apply((select(filter(Merged, type=="test" & feature=="total_acc_z"),1:128)),2,sd))
SD_train_body_acc_x<-as.data.frame(apply((select(filter(Merged, type=="train" & feature=="body_acc_x"),1:128)),2,sd))
SD_train_body_acc_y<-as.data.frame(apply((select(filter(Merged, type=="train" & feature=="body_acc_y"),1:128)),2,sd))
SD_train_body_acc_z<-as.data.frame(apply((select(filter(Merged, type=="train" & feature=="body_acc_z"),1:128)),2,sd))
SD_train_body_gyro_x<-as.data.frame(apply((select(filter(Merged, type=="train" & feature=="body_gyro_x"),1:128)),2,sd))
SD_train_body_gyro_y<-as.data.frame(apply((select(filter(Merged, type=="train" & feature=="body_gyro_y"),1:128)),2,sd))
SD_train_body_gyro_z<-as.data.frame(apply((select(filter(Merged, type=="train" & feature=="body_gyro_z"),1:128)),2,sd))
SD_train_total_acc_x<-as.data.frame(apply((select(filter(Merged, type=="train" & feature=="total_acc_x"),1:128)),2,sd))
SD_train_total_acc_y<-as.data.frame(apply((select(filter(Merged, type=="train" & feature=="total_acc_y"),1:128)),2,sd))
SD_train_total_acc_z<-as.data.frame(apply((select(filter(Merged, type=="train" & feature=="total_acc_z"),1:128)),2,sd))

# Renames the measurement data frame variables
colnames(SD_test_body_acc_x) <- "SD_test_body_acc_x"
colnames(SD_test_body_acc_y) <- "SD_test_body_acc_y"
colnames(SD_test_body_acc_z) <- "SD_test_body_acc_z"
colnames(SD_test_body_gyro_x) <- "SD_test_body_gyro_x"
colnames(SD_test_body_gyro_y) <- "SD_test_body_gyro_y"
colnames(SD_test_body_gyro_z) <- "SD_test_body_gyro_z"
colnames(SD_test_total_acc_x) <- "SD_test_total_acc_x"
colnames(SD_test_total_acc_y) <- "SD_test_total_acc_y"
colnames(SD_test_total_acc_z) <- "SD_test_total_acc_z"
colnames(SD_train_body_acc_x) <- "SD_train_body_acc_x"
colnames(SD_train_body_acc_y) <- "SD_train_body_acc_y"
colnames(SD_train_body_acc_z) <- "SD_train_body_acc_z"
colnames(SD_train_body_gyro_x) <- "SD_train_body_gyro_x"
colnames(SD_train_body_gyro_y) <- "SD_train_body_gyro_y"
colnames(SD_train_body_gyro_z) <- "SD_train_body_gyro_z"
colnames(SD_train_total_acc_x) <- "SD_train_total_acc_x"
colnames(SD_train_total_acc_y) <- "SD_train_total_acc_y"
colnames(SD_train_total_acc_z) <- "SD_train_total_acc_z"

# 5.From the data set in step 4, creates a second, independent tidy data set with the SD of each variable for each activity and each subject.
Merged2<-cbind(SD_test_body_acc_x,SD_test_body_acc_y,SD_test_body_acc_z,SD_test_body_gyro_x,SD_test_body_gyro_y,SD_test_body_gyro_z,SD_test_total_acc_x,SD_test_total_acc_y,SD_test_total_acc_z,SD_train_body_acc_x,SD_train_body_acc_y,SD_train_body_acc_z,SD_train_body_gyro_x,SD_train_body_gyro_y,SD_train_body_gyro_z,SD_train_total_acc_x,SD_train_total_acc_y,SD_train_total_acc_z)
write.table(Merged2,file="Merged2.txt")