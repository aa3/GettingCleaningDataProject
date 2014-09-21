# Getting and Cleaning Data Course Project

## Assignement 
(from the course website at https://class.coursera.org/getdata-007/human_grading/view/courses/972585/assessments/3/submissions)

You should create one R script called run_analysis.R that does the following.
 
1.Merges the training and the test sets to create one data set.
2.Extracts only the measurements on the mean and standard deviation for each measurement. 
3.Uses descriptive activity names to name the activities in the data set
4.Appropriately labels the data set with descriptive variable names. 
5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Analysis sequence

0. The analysis will require loading "data.table" and "reshape" libraries.
1. Download the data for the project from (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).
2. Unzip the data ("UCI HAR Dataset" folder) into your working directory. Example "./YourWorkingDirectoryName/UCI HAR Dataset"
3. Run the script from the provided "run_analysis.R" file to produce the "final.txt" file containing a tidy data set with the average of each variable for each activity and each subject.
 
