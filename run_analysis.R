# Name of this script:        run_analysis.R  
# Purpose of this script:     to merge, name and extract data as documented in steps 1-3 below.

# Data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
# comprising: train and test datasets (as subdirectories)
#             activity_labels.txt file describing labels
#             features.txt, features_info.txt files describing features
#             README.txt file

# Steps:

# ----------------------------------------------------------------
# 1. Merges the training and the test sets to create one data set.
# ----------------------------------------------------------------

# "X"

X <- rbind(read.table("train/X_train.txt"), read.table("test/X_test.txt"))

# "subject"

subject <- rbind(read.table("train/subject_train.txt"), read.table("test/subject_test.txt"))

# "y"

y <- rbind(read.table("train/y_train.txt"), read.table("test/y_test.txt"))

# ------------------------------------------------------------------------------------------
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# ------------------------------------------------------------------------------------------

all_features <- read.table("features.txt")
selected_features <- grep("-mean\\(\\)|-std\\(\\)", all_features[, 2])

X <- X[, selected_features]
names(X) <- all_features[selected_features, 2]
names(X) <- gsub("\\(|\\)", "", names(X))
names(X) <- tolower(names(X))

# --------------------------------------------------------------------------
# 3. Uses descriptive activity names to name the activities in the data set.
# --------------------------------------------------------------------------

activities <- read.table("activity_labels.txt")
activities[, 2] = gsub("_", "", tolower(as.character(activities[, 2])))
y[,1] = activities[y[,1], 2]
names(y) <- "activity"

# ---------------------------------------------------------------------
# 4. Appropriately labels the data set with descriptive activity names.
# ---------------------------------------------------------------------

names(subject) <- "subject_name"
merged_and_projected <- cbind(subject, y, X)
write.table(merged_and_projected, "merged_and_projected.txt")

# ------------------------------------------------------------------------------------
# 5. From the data set in step 4, creates a second, independent tidy data set with the
#    average of each variable for each activity and each subject.
# ------------------------------------------------------------------------------------

uniqueSubjects = unique(subject)[,1]
numSubjects = length(unique(subject)[,1])
numActivities = length(activities[,1])
numCols = dim(merged_and_projected)[2]
averages = merged_and_projected[1:(numSubjects*numActivities), ]

# Consolidation of data

ii = 1
for (i in 1:numSubjects) {
    for (j in 1:numActivities) {
        averages[ii, 1] = uniqueSubjects[i]
        averages[ii, 2] = activities[j, 2]
        aux <- merged_and_projected[merged_and_projected$subject == i & merged_and_projected$activity == activities[j, 2],]
        averages[ii, 3:numCols] <- colMeans(aux[, 3:numCols])
        ii = ii + 1
    }
}

# Writing data (without row names)

write.table(averages, "averages.txt", row.name=FALSE)

