<b>Raw data used</b>

main directory: features.txt (names of the variables for which the means will be calculated), activity_labels.txt (labels of the measured activities)

test directory: subject_test.txt (test subjects ids for each test), X_test.txt (tests), y_test.txt (activities for each test)

train directory: subject_train.txt (training subjects ids for each test), X_train.txt (trainings), y_train.txt (activities for each training)

<b>Variables and data sets</b>

work - working directory path-holder

b - working directory's directories' names-holder

directories - a character vector used for the if statement


columns - dataset of column names for the tests and trainings, read from features.txt


ttsubject - dataset of test subjects for each test, read from subject_test.txt

ttXX - dataset of tests, read from X_test.txt

ttyy - dataset of activities for each test, read from y_test.txt


trsubject - dataset of test subjects for each training, read from subject_train.txt

trXX - dataset of trainings, read from X_train.txt

tryy - dataset of activities for each training, read from y_train.txt


ttXX2 - dataset of tests, only with variables on means (with mean() in name)

ttXX3 - dataset of tests, only with variables on standard deviation (with std() in name)

trXX2 - dataset of trainings, only with variables on means (with mean() in name)

trXX3 - dataset of trainings, only with variables on standard deviation (with std() in name)


tt - dataset of tests, with Subject and Activity columns and variables on means and standard deviation; created by cbinding ttsubject, ttXX2, ttXX3, ttyy

tr - dataset of trainings, with Subject and Activity columns and variables on means and standard deviation; created by cbinding trsubject, trXX2, trXX3, tryy

complete_set - tt - dataset of both tests and trainings, with Subject and Activity columns and variables on means and standard deviation; created by rbinding tt and tr


alabels - dataset of activity labels, read from activity_labels.txt


tidy - molten complete_set by Subject and Activity as ids

tidy2 - dcasted tidy with mean of each variable for each pair of Subject and Activity

<b>Steps of getting to tidy dataset</b>

1. Load reshape2 package.

2. Choose working directory (setwd()).
 
3. Remember working directory in variable work and names of the directories in it in vector b. Check for the structure of directories by comparing b and directories vectors and read files from appropriate paths. Datasets created: columns, ttsubject, ttXX, ttyy, trsubject, trXX, tryy.

4. Change necessary column names in created datasets, in order to use rbind later.

5. Extract the measurements on the mean and standard deviation using grep for both test and training data sets. 

6. Create two datasets with all test (tt) and training (tr) data by cbind. Rbind the datasets, creating complete_set dataset.

7. Read the table for activity labels to alabels. Apply labels to the combined dataset by changing the type of the column Activity to factor, using factor() function with alabels$V2 column as labels vector.

8. Melt the dataset, using Subject and Activity as ids while calling melt from reshape2 package.

9. Calculate the mean of each variable for each distinctive Subject and Activity pair, by calling dcast function from reshape2 package.

10. Write the tidy dataset to a tidy_data.txt file in the working directory.
