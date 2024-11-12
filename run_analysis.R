# Load necessary libraries
library(dplyr)

# Step 1: Merge the training and test data sets
# Load data files
X_train <- read.table("/Users/radhikarajdev/Downloads/UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("/Users/radhikarajdev/Downloads/UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("/Users/radhikarajdev/Downloads/UCI HAR Dataset/train/subject_train.txt")

X_test <- read.table("/Users/radhikarajdev/Downloads/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("/Users/radhikarajdev/Downloads/UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("/Users/radhikarajdev/Downloads/UCI HAR Dataset/test/subject_test.txt")

# Merge the training and test data sets
X <- rbind(X_train, X_test)
y <- rbind(y_train, y_test)
subject <- rbind(subject_train, subject_test)

# Step 2: Extract the measurements on the mean and standard deviation for each measurement
# Load the features list
features <- read.table("/Users/radhikarajdev/Downloads/UCI HAR Dataset/features.txt")

# Extract the column names of features related to mean and std
mean_and_std_features <- grep("-(mean|std)\\(\\)", features$V2)

# Subset the dataset to include only the selected features
X_selected <- X[, mean_and_std_features]

# Assign the correct column names from the features
colnames(X_selected) <- features$V2[mean_and_std_features]

# Step 3: Use descriptive activity names to name the activities in the dataset
# Load the activity labels
activity_labels <- read.table("/Users/radhikarajdev/Downloads/UCI HAR Dataset/activity_labels.txt")

# Replace activity codes with activity labels
y$V1 <- activity_labels$V2[y$V1]

# Step 4: Appropriately label the dataset with descriptive variable names
# Create a combined dataset with subject, activity, and the selected features
data <- cbind(subject, y, X_selected)

# Rename columns with descriptive names
colnames(data) <- c("Subject", "Activity", colnames(X_selected))

# Step 5: Create a tidy dataset with the average of each variable for each activity and each subject
tidy_data <- data %>%
  group_by(Subject, Activity) %>%
  summarise(across(everything(), mean))

# Write the tidy data set to a file
write.table(tidy_data, "tidy_data.txt", row.names = FALSE)

# Return the tidy dataset as a result
tidy_data

