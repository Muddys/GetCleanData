rm(list=ls())

# 1. Merges the training and the test sets to create one data set.

# read the values
x_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")

x_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")

# combine the test and train data sets
x_data <- rbind(x_test, x_train)
y_data <- rbind(y_test, y_train)
subject_data <- rbind(subject_test, subject_train)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 

# read the feature list
features <- read.table("UCI HAR Dataset/features.txt")

# select only the lines that have mean or std in the feature description
features_mean_std <- grep("mean|std", features$V2)

x_data <- x_data[, features_mean_std]


# 3. Uses descriptive activity names to name the activities in the data set
activities <- read.table("UCI HAR Dataset/activity_labels.txt")

y_data[, 1] <- activities[y_data[,1], 2]

# 4. Appropriately labels the data set with descriptive variable names. 
y_data <- setNames(y_data, "activity")
x_data <- setNames(x_data, features[features_mean_std, "V2"])
subject_data <- setNames(subject_data, "subject")

# bind the full data set together from the 3 pieces
data <- cbind(subject_data, y_data, x_data)

# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
tidy_data <- NULL

# go through the data for each subject and activity and calculate the mean for each variable
for (i in unique(data$subject))
{
	for (j in unique(data$activity))
	{
		temp <- data[data$subject == i & data$activity == j, 3:length(data)]
		tidy_data <- rbind(tidy_data, c(i, j, colMeans(temp)))
	}
}

# set the names for the 1st 2 columns of our tidy data set
colnames(tidy_data)[1] <- "subject"
colnames(tidy_data)[2] <- "activity"

# write the tidied data set to a file
write.table(tidy_data, "tidy_data.txt", row.name=FALSE)