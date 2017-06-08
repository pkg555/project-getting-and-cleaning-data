# Getting and Cleaning Data - Project
### Pawan Gupta
### June 7, 2017


# Project Description
This document describes the code in run_analysis.R.

## Collection of the raw data
data was download from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Data
The dataset includes the following files:

- 'README.txt'
- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent.

'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

## Transformation
There are 5 parts:

- Download and unzip dataset
- Merges the training and the test sets to create one data set.
- Extracts only the measurements on the mean and standard deviation for each measurement.
- Uses descriptive activity names to name the activities in the data set
- Appropriately labels the data set with descriptive activity names.
- Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Run run_analysis.R

- Load both test and train data
- Load the features and activity labels.
- Extract the mean and standard deviation column names and data.
- Process the data. There are two parts processing test and train data respectively.
- Merge data set.
