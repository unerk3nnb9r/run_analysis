Instructions to run the script "run_analysis.R" for the cleaning of data about Human Activity Recognition Using Smartphones.

The source data is described in:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The source data is contained in the zipped container
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
which is to be cleaned by this script to comply with the tidy data standard.

Instructions (for Windows; similar instructions apply to other platforms by changing "\" by "/" as appropriate):

Download and unzip the source into a folder. Locate the subdirectory "UCI HAR Dataset" that is created inside that folder during the unzip operation.

Download, fork or copy the script "run_analysis.R" from this repository into:
{your_path}\{your_folder}\UCI HAR Dataset\
Depending on how you unzip the container, a nested structure of subdirectories could appear. In what follows, we refer to the inner "UCI HAR Dataset" subdirectory, which is the one that directly contains the subfolders "test" and "train".

Open RStudio and change to this directory. For instance: setwd("{your_drive_letter}:\\{your_path}\\{your_folder}\\UCI HAR Dataset\\").
You need to duplicate all the "\" (even inside your path), so that they are recognized as characters and not as escape.

Source the script:
source("run_analysis.R")

The script does not assume a given number of records or features. All dimensions are calculated from the content. The data must observe the structure given en the description and fit into the available memory.
