###Codebook for run_analysis.R



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






#Variables:


Subject
1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
20
21
22
23
24
25
26
27
28
29
30


Activity
1 WALKING

2 WALKING_UPSTAIRS

3 WALKING_DOWNSTAIRS

4 SITTING

5 STANDING
6 LAYING


tbodyaccmeanx 


tbodyaccmeany 


tbodyaccmeanz


tgravityaccmeanx


tgravityaccmeany


tgravityaccmeanz


tbodyaccjerkmeanx


tbodyaccjerkmeany


tbodyaccjerkmeanz


tbodygyromeanx


tbodygyromeany


tbodygyromeanz


tbodygyrojerkmeanx


tbodygyrojerkmeany


tbodygyrojerkmeanz


tbodyaccmagmean


tgravityaccmagmean


tbodyaccjerkmagmean


tbodygyromagmean


tbodygyrojerkmagmean


fbodyaccmeanx


fbodyaccmeany


fbodyaccmeanz


fbodyaccmeanfreqx


fbodyaccmeanfreqy


fbodyaccmeanfreqz


fbodyaccjerkmeanx


fbodyaccjerkmeany


fbodyaccjerkmeanz


fbodyaccjerkmeanfreqx


fbodyaccjerkmeanfreqy


fbodyaccjerkmeanfreqz


fbodygyromeanx


fbodygyromeany


fbodygyromeanz


fbodygyromeanfreqx


fbodygyromeanfreqy


fbodygyromeanfreqz


fbodyaccmagmean


fbodyaccmagmeanfreq


fbodybodyaccjerkmagmean


fbodybodyaccjerkmagmeanfreq


fbodybodygyromagmean


fbodybodygyromagmeanfreq


fbodybodygyrojerkmagmean


fbodybodygyrojerkmagmeanfreq


angletbodyaccmeangravity


angletbodyaccjerkmeangravitymean


angletbodygyromeangravitymean


angletbodygyrojerkmeangravitymean


anglexgravitymean


angleygravitymean


anglezgravitymean


tbodyaccstdx


tbodyaccstdy


tbodyaccstdz


tgravityaccstdx


tgravityaccstdy


tgravityaccstdz


tbodyaccjerkstdx


tbodyaccjerkstdy


tbodyaccjerkstdz


tbodygyrostdx


tbodygyrostdy


tbodygyrostdz


tbodygyrojerkstdx


tbodygyrojerkstdy


tbodygyrojerkstdz


tbodyaccmagstd


tgravityaccmagstd


tbodyaccjerkmagstd


tbodygyromagstd


tbodygyrojerkmagstd


fbodyaccstdx


fbodyaccstdy


fbodyaccstdz


fbodyaccjerkstdx


fbodyaccjerkstdy


fbodyaccjerkstdz


fbodygyrostdx


fbodygyrostdy


fbodygyrostdz


fbodyaccmagstd


fbodybodyaccjerkmagstd


fbodybodygyromagstd


fbodybodygyrojerkmagstd