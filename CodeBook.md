Steps of getting to tidy dataset.

1. Load plyr package.

2. Choose working directory (setwd()).
 
3. Remember working directory, names of the directory in it. Check for the structure and read files accordingly.

4. Change necessary column names, in order to use rbind later.

5. Extract the measurements on the mean and standard deviation for both test and training data sets. 

6. Create two datasets with all test and training data by cbind. Rbind the datasets.

7. Read the table for activity labels. Apply labels to the combined dataset.

8. Melt the dataset, using Subject and Activity as ids.

9. Calculate the mean of each variable for each distinctive Subject and Activity pair.

10. Write the tidy dataset to a .txt file in the working directory.
