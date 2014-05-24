getting_and_cleaning_data_course_project
========================================

My course project for Getting and Cleaning Data Course (Coursera)

This is a course project for Getting and Cleaning Data Course - https://class.coursera.org/getdata-003/.

The purpose of this project is as follows:

1. Get the data from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
(available also at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).

2. Read the main text files for test and training subjects into R, meaning all files from train and test directories,
but not from subdirectories, and files with column names from the main directory (features.txt & activity_labels.txt).

3. Create one big dataset (merge test and training files).

4. Apply column labels from features.txt and subset to the ones concerning means and standard deviations
(basically with mean() and std() in their names).

5. Apply appropriate lables for activities (from activity_labels.txt).

6. Create a tidy dataset with means of the variables for each pair of subject and activity. 

7. Export the dataset.

In accordance with the Honor Code, I certify that my answers here are my own work, 
and that I have appropriately acknowledged all external sources (if any) that were used in this work.
