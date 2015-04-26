# Source packages needed
library(dplyr)

# Set True for Windows OS
setInternet2(use = TRUE)
if(!file.exists("/.data")) {dir.create("./data")}
fileUrl = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "./data/run.zip")
dateDownloaded <- date()
unzip("./data/run.zip", exdir = "./data/run_data")


features <- read.table("./data/run_data/UCI HAR Dataset/features.txt")
activity_labels <- read.table("./data/run_data/UCI HAR Dataset/activity_labels.txt")

x_test <- read.table("./data/run_data/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./data/run_data/UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./data/run_data/UCI HAR Dataset/test/subject_test.txt")

x_train <- read.table("./data/run_data/UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./data/run_data/UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./data/run_data/UCI HAR Dataset/train/subject_train.txt")

features2 <- gsub("-", "", features$V2, fixed = TRUE)
features2 <- gsub("(", "", features2, fixed = TRUE)
features2 <- gsub(")", "", features2, fixed = TRUE)
features2 <- gsub(" ", "", features2, fixed = TRUE)
features2 <- gsub(",", "", features2, fixed = TRUE)
features2 <- tolower(features2)
features2 <- gsub("tbody", "timebody", features2, fixed = TRUE)
features2 <- gsub("tgravity", "timegravity", features2, fixed = TRUE)
features2 <- gsub("fbody", "frequencybody", features2, fixed = TRUE)
features2 <- gsub("acc", "acceleration", features2, fixed = TRUE)
features2 <- make.names(features2, unique = TRUE)

names(x_test) <- features2
names(x_train) <- features2
names(y_test) <- "Activity"
names(y_train) <- "Activity"
names(subject_test) <- "Subject"
names(subject_train) <- "Subject"

test <- cbind(x_test, y_test, subject_test)
train <- cbind(x_train, y_train, subject_train)
all_data <- rbind(test, train)

all_table <- tbl_df(all_data)
mean_std_table <- select(all_table, contains("mean"), contains("std"), Activity, Subject)
meanstd <- mutate(meanstd, Activity = activity_labels[Activity, 2])
summarised_data <- summarise_each(group_by(meanstd, Subject, Activity), funs(mean))

write.table(summarised_data, file = "./data/run_tidy_data.txt", row.names = FALSE)
