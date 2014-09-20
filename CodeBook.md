Original data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Original description: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The attached R script (run_analysis.R) merges the train and test datasets found in the source, cleaning the data and extracting the mean and standard deviation for measurements.

After initial merging, this dataset comprises:

X: the features captured for a subject performing an activity at a given time interval. There are 561 features and 10299 subject+activity+interval instances, therefore this constitutes a 10299 x 561 frame.

subject: the name of the subject performing an activity at a given time interval. There is 1 name and 10299 subject+activity+interval instances, therefore this constitutes a 10299 x 1 frame.

y: the name of the activity performed by a subject at a given time interval. There is 1 name and 10299 subject+activity+interval instances, therefore this constitutes a 10299 x 1 frame.

Next, mean and standard deviation measurements are extracted. Only 66 features lay in this category, therefore the result is a 10299 x 66 frame. Mean and standard deviation appear to have been normalized, laying in the range (-1, 1).

Next, activities are given to meaningful names based on the content of the file "activity_labels.txt": 

    walking
    walkingupstairs
    walkingdownstairs
    sitting
    standing
    laying

Next, data receives appropriate labels using descriptive names, and all names are beautified by converting them to lower case and removing underscores and brackets.

So far, the data has been merged but is still distributed in separate frames.

Next, frames X, subject and y are adjoined into a 10299 x 68 frame whose first column is subject's name, the second column is activity's name, and the last 66 columns are the corresponding measurements. That brings all the data together in a tidy frame.

Finally, the clean dataset with the average of each measurement for each activity and subject is created and saved (as required, minus subject's name). There are 30 subjects and 6 activities, therefore this dataset contains a 180 x 6 frame.
