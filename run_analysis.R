features <- read.table('features.txt')
activity <- read.table('activity_labels.txt')
subjectTrain <- read.table('./train/subject_train.txt')
XTrain <- read.table('./train/X_train.txt')
YTrain <- read.table('./train/y_train.txt')
subjectTest <- read.table('./test/subject_test.txt')
XTest <- read.table('./test/X_test.txt')
YTest <- read.table('./test/y_test.txt')
colnames(features) <- c('featID', 'features')
colnames(activity) <- c('actID', 'actType')
colnames(subjectTrain) <- colnames(subjectTest) <- 'subID'
colnames(XTrain) <- colnames(XTest) <- features$features
colnames(YTrain) <- colnames(YTest) <- 'actID'
train <- cbind(YTrain, subjectTrain, XTrain)
test <- cbind(YTest, subjectTest, XTest)
data <- rbind(train, test)
extractColumn <- colnames(data)[grepl('-std', colnames(data))
                                | grepl('-mean', colnames(data)) 
                                & !grepl('-meanFreq', colnames(data))
                                | grepl('act', colnames(data)) 
                                | grepl('sub', colnames(data))]
data <- data[, extractColumn]
data <- merge(data, activity, by='actID')
colnames(data) <- gsub('\\()', '', colnames(data))
colnames(data) <- gsub('^t', 'time-', colnames(data))
colnames(data) <- gsub('^f', 'freq-', colnames(data))
colnames(data) <- gsub('Mag', 'Magnitude', colnames(data))
tidyData <- data[,colnames(data) != 'actType']
tidyData <- aggregate(tidyData[, colnames(tidyData) != c('actID', 'subID')],
                      by = list(actID=tidyData$actID, subID=tidyData$subID),
                      mean)
tidyData <- merge(tidyData, activity, by='actID')
write.table(tidyData, file='tidyData.txt', row.names=FALSE)