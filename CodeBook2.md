<b>Raw data used</b>

main directory: features.txt (names of the variables for which the means will be calculated), activity_labels.txt (labels of the measured activities)

test directory: subject_test.txt (test subjects ids for each test), X_test.txt (tests), y_test.txt (activities for each test)

train directory: subject_train.txt (training subjects ids for each test), X_train.txt (trainings), y_train.txt (activities for each training)

<i>Subjects</i>

Subject ids

<i>Activities</i>
Possible subject activities:

1. Walking

2. Walking downstairs

3. Walking upstairs

4. Sitting

5. Standing

6. Laying

<i>Means</i>

tbodyacc.mean.x - mean linear acceleration of body in x-direction, measured in standard gravity units 'g'

tbodyacc.mean.y - mean linear acceleration of body in y-direction, measured in standard gravity units 'g'

tbodyacc.mean.z - mean linear acceleration of body in z-direction, measured in standard gravity units 'g'

tgravityacc.mean.x - mean linear acceleration due to gravity in x-direction, measured in standard gravity units 'g'

tgravityacc.mean.y - mean linear acceleration due to gravity in y-direction, measured in standard gravity units 'g'

tgravityacc.mean.z - mean linear acceleration due to gravity in z-direction, measured in standard gravity units 'g'

tbodygyro.mean.x - mean angular velocity of body in x-direction, measured in radians/second

tbodygyro.mean.y - mean angular velocity of body in y-direction, measured in radians/second

tbodygyro.mean.z - mean angular velocity of body in z-direction, measured in radians/second

fbodyacc.mean.x - mean linear acceleration of body in x-direction, measured in standard gravity units 'g'

fbodyacc.mean.y - mean linear acceleration of body in y-direction, measured in standard gravity units 'g'

fbodyacc.mean.z - mean linear acceleration of body in z-direction, measured in standard gravity units 'g'

fbodygyro.mean.x - mean angular velocity of body in x-direction, measured in radians/second

fbodygyro.mean.y - mean angular velocity of body in y-direction, measured in radians/second

fbodygyro.mean.z - mean angular velocity of body in z-direction, measured in radians/second

<i>Standard deviations</i>

tbodyacc.sd.x - standard deviation of mean linear acceleration of body in x-direction, measured in standard gravity units 'g'

tbodyacc.sd.y - standard deviation of mean linear acceleration of body in y-direction, measured in standard gravity units 'g'

tbodyacc.sd.z - standard deviation of mean linear acceleration of body in z-direction, measured in standard gravity units 'g'

tgravityacc.sd.x - standard deviation of mean linear acceleration due to gravity in x-direction, measured in standard gravity units 'g'

tgravityacc.sd.y - standard deviation of mean linear acceleration due to gravity in y-direction, measured in standard gravity units 'g'

tgravityacc.sd.z - standard deviation of mean linear acceleration due to gravity in z-direction, measured in standard gravity units 'g'

tbodygyro.sd.x - standard deviation of mean angular velocity of body in x-direction, measured in radians/second

tbodygyro.sd.y - standard deviation of mean angular velocity of body in y-direction, measured in radians/second

tbodygyro.sd.z - standard deviation of mean angular velocity of body in z-direction, measured in radians/second

fbodyacc.sd.x - standard deviation of mean linear acceleration of body in x-direction, measured in standard gravity units 'g'

fbodyacc.sd.y - standard deviation of mean linear acceleration of body in y-direction, measured in standard gravity units 'g'

fbodyacc.sd.z - standard deviation of mean linear acceleration of body in z-direction, measured in standard gravity units 'g'

fbodygyro.sd.x - standard deviation of mean angular velocity of body in x-direction, measured in radians/second

fbodygyro.sd.y - standard deviation of mean angular velocity of body in y-direction, measured in radians/second

fbodygyro.sd.z - standard deviation of mean angular velocity of body in z-direction, measured in radians/second


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

5. Extract the measurements on the mean and standard deviation using grep for both test and training data sets - datasets created ttXX2, ttXX3, trXX2, trXX3.

6. Create two datasets with all test (tt) and training (tr) data by cbind. Rbind the datasets, creating complete_set dataset.

7. Read the table for activity labels to alabels. Apply labels to the combined dataset by changing the type of the column Activity to factor, using factor() function with alabels$V2 column as labels vector.

8. Melt the dataset, using Subject and Activity as ids while calling melt from reshape2 package.

9. Calculate the mean of each variable for each distinctive Subject and Activity pair, by calling dcast function from reshape2 package.

10. Write the tidy dataset to a tidy_data.txt file in the working directory.



Data taken from "Human Activity Recognition Using Smartphones Dataset, Version 1.0"

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
