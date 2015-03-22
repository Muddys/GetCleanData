# CodeBook

This is a codebook describing the variables and steps taken to clean the data for Getting and Cleaning Data course project.

## Original data

A full description of the data we use can be obtained from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
And the actual dataset from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The data is from an experiment with 30 volunteers each doing 6 different activities. The actual data is accelerometer and gyroscope data from a smartphone sensor signals from the volunteers doing the activities. The data set is divided to a training set (70%) and test set (30%).

## Files in the data set

The data set includes several files:

* `README.txt`
* `features_info.txt`: Shows information about the variables used on the feature vector.
* `features.txt`: List of all features.
* `activity_labels.txt`: Links the class labels with their activity name.
* `train/X_train.txt`: Training set.
* `train/y_train.txt`: Training labels.
* `test/X_test.txt`: Test set.
* `test/y_test.txt`: Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 
* `train/subject_train.txt`: Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
* `train/Inertial Signals/total_acc_x_train.txt`: The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 
* `train/Inertial Signals/body_acc_x_train.txt`: The body acceleration signal obtained by subtracting the gravity from the total acceleration. 
* `train/Inertial Signals/body_gyro_x_train.txt`: The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

# Goal
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names.
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# Steps taken
1. Read the data from `X_train.txt`, `y_train.txt`, `X_test.txt`, `y_test.txt`, `subject_train.txt` and `subject_test.txt` files
2. Bind these together so we get 3 data variables `x_data`, `y_data` and `subject_data`
3. Read the feature list in `features.txt` file
4. Use the feature list to select the features corresponding to mean and standard deviation
5. Name the different columns in the data frame based on the names in the feature list
6. Change the activities from numbers to descriptive names based on `activity_labels.txt` file
7. Create the full data set by combining the `subject_data`, `y_data` and `x_data` sets
8. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. Do this by selecting data based on each subject and activity from the full data set and then counting column means on that data.

# Variables
* `x_train`, `y_train`, `x_test`, `y_test`, `subject_train` and `subject_test` contain the data from the downloaded files
* `x_data`, `y_data` and `subject_data` are merges of the previous datasets
* `features` contains the feature names for the x-data. 
* `features_mean_std`, a vector with the numbers of the features corresponding to mean and standard deviation
* `activities` is a look up table for the activities and their numeric codes
* `data` is the full data set
* `tidy_data` is the final product including only the average of each variable for each activity and each subject