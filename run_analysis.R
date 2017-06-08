library(data.table)

#download and unzip data
setwd("~/Desktop/Coursera")
if(!file.exists("./wk4data")){dir.create("./wk4data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./wk4data/Dataset.zip",method="curl")
unzip(zipfile="./wk4data/Dataset.zip",exdir="./wk4data")


# Load activity labels + features
activityLabels <- read.table("./wk4data/UCI HAR Dataset/activity_labels.txt")
activityLabels[,2] <- as.character(activityLabels[,2])
features <- read.table("./wk4data/UCI HAR Dataset/features.txt")
features[,2] <- as.character(features[,2])

# Extract only the data on mean and standard deviation
NeededMeasurements <- grep(".*mean.*|.*std.*", features[,2])
NeededMeasurements.names <- features[NeededMeasurements,2]
NeededMeasurements.names = gsub('-mean', 'Mean', NeededMeasurements.names)
NeededMeasurements.names = gsub('-std', 'Std', NeededMeasurements.names)
NeededMeasurements.names <- gsub('[-()]', '', NeededMeasurements.names)

# Load the datasets
train <- read.table("./wk4data/UCI HAR Dataset/train/X_train.txt")[NeededMeasurements]
trainActivities <- read.table("./wk4data/UCI HAR Dataset/train/Y_train.txt")
trainSubjects <- read.table("./wk4data/UCI HAR Dataset/train/subject_train.txt")
train <- cbind(trainSubjects, trainActivities, train)

test <- read.table("./wk4data/UCI HAR Dataset/test/X_test.txt")[NeededMeasurements]
testActivities <- read.table("./wk4data/UCI HAR Dataset/test/Y_test.txt")
testSubjects <- read.table("./wk4data/UCI HAR Dataset/test/subject_test.txt")
test <- cbind(testSubjects, testActivities, test)

# merge datasets and add labels
combinedData <- rbind(train, test)
colnames(combinedData) <- c("subject", "activity", NeededMeasurements.names)

# turn activities & subjects into factors
combinedData$activity <- factor(combinedData$activity, levels = activityLabels[,1], labels = activityLabels[,2])
combinedData$subject <- as.factor(combinedData$subject)

combinedData.melted <- melt(combinedData, id = c("subject", "activity"))
combinedData.mean <- dcast(combinedData.melted, subject + activity ~ variable, mean)

write.table(combinedData.mean, "tidy.txt", row.names = FALSE, quote = FALSE)
