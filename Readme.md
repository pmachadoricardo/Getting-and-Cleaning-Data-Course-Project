###Readme for run_analysis.R

The script reads and merges eight different data files, and writes a tidy data set to a txt file.

#How to run the script:
Install dplyr package in R
Run run_analysis.R

The script should download and unzip the raw data, and create the apropriate directories.



Raw data is divided in six different data files: "X_test.txt", "y_test.txt", "subject_test.txt", "X_train.txt", "y_train.txt" and "subject_train.txt". 

Variable names and activity names are in the following files: "features.txt", "activity_labels.txt".

The raw data was read into 6 separate data tables. 

The following characters were removed from the variable names to avoid errors: "(", ")", "-", " ", ",". Variable names were transformed to lowercase and passed through make.names() to remove duplicates.

Variable names were applied to the "x_test" and "x_train" data tables's column names. "y_test" and "x_test" were given "Activity" as a variable name. "subject_test" and "subject_train" were given "Subject" as a variable name.

The test data tables were joined using cbind. Same for the train data tables.

The test and train data tables were joined using rbind.

The data was transformed to a data frame tbl.

From the total data, was extracted only the measurements on the mean and standard deviation for each measurement, and the Activity and Subject.

Activity values were transformed, using mutate and the activity_labels data table, to give it descriptive names.

The data was grouped by Subject and Activity, and each variable was summarised. All the variables, except "Subject" and "Activity", are mean values.

The data was written as a tidy data set to a txt file created with write.table(), "run_tidy_data.txt".