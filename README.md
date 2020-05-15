# Human-Activity-Recognition-R-Data-Cleaning-Project

This is the repository for the final peer graded assignment on Coursera:

> Course 3: Getting And Cleaning Data, 
> from Data Science Specialization, 
> by Johns Hopkins University

Taught by: 
 
  - Jeff Leek, Phd 
  - Roger D. Peng, Phd
  - Brian Caffo, Phd
  
  
##Overview of the assignment:

####The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set.


Criterias: 

- The submitted data set is tidy.
- The Github repo contains the required scripts.
- GitHub contains a code book that modifies and updates the available codebooks with the data to indicate all the variables and summaries calculated, along with units, and any other relevant information.
- The README that explains the analysis files is clear and understandable.
- The work submitted for this project is the work of the student who submitted it.




Instructions: 

You should create one R script called run_analysis.R that does the following:

1. Merges the training and the test sets to create one data set. 
2. Extracts only the measurements on the mean and standard deviation for
each measurement. 
3. Uses descriptive activity names to name the activities in the data set 
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set
with the average of each variable for each activity and each subject. 


Data background information:

>One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:
>
>http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
>
>Here are the data for the project:
>
>https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


##Analysis (run_analysis.R)
This script will perform a cleaning and analysis on downloaded data and output a summary data file


####STEP 0 - Download the required dataset into our WD:

This will download the Human Activity Recognition data from the link mentioned above (see data background information) and extract the folder of datasets into your working directory. There is no need to create a subdirectory for data, as the zip file already contains a parent folder for all the datasets.


####STEP 1 - Merge the training and the test sets to create one data set: 

There are two overall datasets that we wish to combine: training and testing data. X_test and X_train are the main datasets. Each of these datasets have two variables which are put into separate files: y_test / y-train and subject_test / subject_train. Y is the activity labels and subject is the subject who performed the test. 

Since these are variables that belong in the main dataset, we will use cbind() to bind these datasets into a single dataset for training and testing respectively:

>       train
>       - subject_train.txt 
>       - X_train.txt 
>       - y_train.txt 
>
>       test
>       - subject_test.txt 
>       - X_test.txt 
>       - y_test.txt 

Now we can merge train and test by rbind() to join them by rows. These two datasets have identical column names and order so we can simple stack them on top of each other. 



####STEP 2 - Extract only the measurements on the mean and standard deviation for each measurement:

We want to now assign column names that are more descriptive than the default V1, V2 ...
The column names are in the feature.txt file, and ordered accordingly based on the original X_****.txt files. Therefore we can just extract the names from that file and append them as the column names in our newly combined dataset from step 1. We will also take this chance to name the first two columns which should be subject and activity - based on the labels they represent.

Now we can filter all the columns with only mean() and std() in their names since we are extracting those variables only. The code extracts all the column indices that contain mean() and std() in their name and indexes the dataset based on those indices (with 1 and 2 which are subject and activity included).


####STEP 3 - Use descriptive activity names to name the activities in the data set:

We wish to replace the numbers in the activity column with their corresponding activity labels / names, which are found in the activity_label.txt. The code uses the the factor function to adjust the factor levels and label the data directly. This will convert the numbers into their corresponding labels and show us the detailed activity names instead of the ambiguous numbers we originally had. 


####STEP 4 - Step 4: Appropriately labels the data set with descriptive variable names:

This step requires us to make sure all columns / variables are named descriptively based on the features.txt file. We have actually already completed this step in step 2 when we extracted the names from features.txt and assigned them to the columns. Because we did them in step 2, all our transformed data kept their column names until now. Therefore, this step is already done, and we now have our tidy data set. 


####STEP 5 - Create a tidy data set with the average of each variable for each activity and each subject:

To output a summarized data, we will use dplyr package functions to transform data into the necessary output. 
First we will group by subject and secondarily by activity. Then, we will calculate the mean for each of the columns based on the groupings. This will give us the mean of the every variable for each subject and their respective activities. We will then sort the data to make sure it looks neat and uniform.

To avoid confusion, we will append an "(Avg)" string to the end of the variable names, so to indicate that these are the average values. 

Finally, we output write the summarized and tidy data to a text file in our working directory which stores our final output data.


