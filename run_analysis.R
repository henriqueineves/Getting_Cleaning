## This script is the final project for the course 3 of Data Science 
## Specialization. 

###Preparation:
#0.1)set the correct working directory
#setwd("The desired workspace); getwd()

#0.2)Loading the necessary packages:
library(zip); library(tidyr); library(dplyr)
#The 'zip' package will be used for unzip the downloaded file.

#0.3)Download the file:
if (!file.exists("Dataset.zip")){
  download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",
                destfile = "./Dataset.zip", method = "curl")
}else{
  print("File already exists")
}

#0.4)Extracting the files from the zip files:
unzip("Dataset.zip", exdir = "./")

#0.5)Oppening the datasets:
#Reading the README.txt, it is possible to identify which are the datasets requested:
train <- read.table("UCI HAR Dataset/train/X_train.txt")
test <- read.table("UCI HAR Dataset/test/X_test.txt")

#These are the labels for the activity 
label_train <- read.table("UCI HAR Dataset/train/y_train.txt")
label_test <- read.table("UCI HAR Dataset/test/y_test.txt")

#This is the label of the features, a.k.a the name of the variables in both datasets:
features <- read.table("UCI HAR Dataset/features.txt")
#Only the second columns is important

#And finally the two datasets of the subject identification:
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")

#0.6)Final processing of the datasets:
#Adding col names, activity and subject:
colnames(train) <- features[,2]
train <- cbind(Activity = label_train[,1], train)
train <- cbind(Subject = subject_train[,1], train)

colnames(test) <- features[,2]
test <- cbind(Activity = label_test[,1], test)
test <- cbind(Subject = subject_test[,1], test)

#Removing to uncluter the workspace
rm(features); rm(label_test); rm(label_train); rm(subject_test); rm(subject_train)

##Now the assignment tasks:
#1)Merges the training and the test sets to create one data set.
main_data <- rbind(train, test)

#2)Extracts only the measurements on the mean and standard deviation for each measurement. 
#Selected which cols have information about the mean and the std:
selected_cols <- grep("(.*)(mean|std)(.)", colnames(main_data))

#Creating the subset dataframe containing the subject names, the activity code and the information about mean and std:
subset <- main_data %>% select(1:2, selected_cols)

#3) Uses descriptive activity names to name the activities in the data set
#Getting the code for the activities:
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
activity_labels <- activity_labels[,2]

#Changing the name according with the code:
subset <- subset %>% mutate(Activity = activity_labels[Activity]); rm(activity_labels)

#4)Appropriately labels the data set with descriptive variable names.
#Already done within step 0.6.

#5)From the data set in step 4, creates a second, independent tidy data set with 
#the average of each variable for each activity and each subject.
tidy_subset <- aggregate( . ~ Subject + Activity, data = subset, FUN = mean)

#Final) exporting the tidy dataset.
write.table(tidy_subset, "Tidy_Dataset.txt", row.names = FALSE)
