# Getting_Cleaning

Introduction:
This is part of the corse project for the Coursera Course 'Getting and cleaning Data", where the objective is to demonstrate the capacities of getting and manipulating the data from a internet to transforma a big and messy data-set in a tidy dataset ready to the analysis. Within this repository, there willl be this file explanning the analysis. Every step on the script is preceded by a number with a very brief description of what is happening in that step. The full explanation will be present in this file.

Datasets:
The original data used in this project comes within a main folder. Within this folder there is the codebok and files explanning the other datasets. The two folder contain the train and tests datasets, which will be used in this project. Each folder has 3 files "subject_(train|test).txt", "X__(train|test).txt" and "y_(train|test).txt". Refering to the 'README.txt' file from the original dataset:
- '(train|test)/X_(train|test).txt': Training set.
- '(train|test)/y_(train|test).txt': Training labels.
- '(train|test)/X_(train|test).txt': Test set.
- '(train|test)/y_(train|test).txt': Test labels.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.

Script:
Preparation:
#0.1)Set the correct working directory:
Simple step to verify and set the correct Workspace, standard for every script.

#0.2)Loading the necessary packages:
Just to prevent any future problems, (re)load all the packages necessary at this point.

#0.3)Download the file:
A conditional loop to check if the file containing the data was already present on the workspace. If not it will download the file. Since it is only one file that will be downloaded, the URL was put directly within the download.file function. Another wat was to create a character variable containning the URL.

#0.4)Extracting the files from the zip files:
Self-expalnatory

#0.5)Oppening the datasets:
In these step, the .txt files within the folders will be oppened to create the followinf data.frames:
>(train|test) : main data frame containing the observations for the measurements taken for both the train and test subjects.
>label_(train|test): data frames with 1 column that contain the code labeling the activity performed
>features: dataframe with 2 columns the second being the names of each variable for the (train|test) subject
>subject_(train|test): dataframe of one column with a number identifying the subject from where the data was collected in the respective main dataframe.

#0.6)Final processing of the datasets:
In this step, the second column of the 'features' dataset will be used to rename the variables in the main dataset and the columns containing the respective Activities and subjects for each dataset is added to the beggining of each main dataset. Finishing this, the auxiliar datasets are remove to clean the workspace. At this point, there are only the two main datasets:
>tain: with 563 columns and 7352 rows
>test: with 563 columns and 2947 rows.

After finishing this, we can begin with the assignments tasks:
#1)Merges the training and the test sets to create one data set.
This will join both of the dataset created in the preparation into one big dataset of 10299 columns and 563 variables.

#2)Extracts only the measurements on the mean and standard deviation for each measurement. 
This was done in two step: first selecting all columns of the dataframe that contain information about the mean and standard deviation. These columns were stored in a vector.

The second step was using the 'select' function to take the 'Subject', 'Activity' columns and all the columns selected previoulsy and assign it to the 'subset' dataframe. This dataframe should have 10299 rows and 81 columns.

#3) Uses descriptive activity names to name the activities in the data set
First, the code for the activities was recovered from the 'activity_labels.txt' within the folder from the datasets. The names of the activities was transformed into the character vector 'activity_labels' in the script.
With this vector and using the 'mutate' function, the column "Activity' within the 'subset' dataframe was edited.

#4)Appropriately labels the data set with descriptive variable names.
This was already done in step 0.6 when the 'features' dataset was assigned as the colnames from both main dataframes.

#5)From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
This was done with the usage of the 'aggregate' function, which separates de big dataframe 'subset' base on the columns 'Subject' and 'Activity' and apply the mean for every column. This dataset should have 180 rows and 81 columns.

#Final) exporting the tidy dataset.
This was simply done with the function 'write.table' to generate a .txt file containning the dataframe produced at the end of item 5.
