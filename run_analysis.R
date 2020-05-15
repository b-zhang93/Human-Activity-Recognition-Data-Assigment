#### Step 0: Downloads our dataset into our wd ####
## Required Packages: dplyr, tidyselect ##

#this will download and create a subfolder with all the datasets if it doesn't exist already
if(!file.exists("./UCI HAR Dataset")){
        fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        download.file(fileUrl,destfile="Data.zip")
        
        # Unzip dataSet to /data directory
        unzip(zipfile="Dataset.zip")
}



#### Step 1: Merges the training and the test sets to create one data set ####

#training data
train_x <- read.table("./UCI HAR Dataset/train/X_train.txt")
train_y <- read.table("./UCI HAR Dataset/train/Y_train.txt")
train_s <- read.table("./UCI HAR Dataset/train/subject_train.txt")

#test data
test_x <- read.table("./UCI HAR Dataset/test/X_test.txt")
test_y <- read.table("./UCI HAR Dataset/test/Y_test.txt")
test_s <- read.table("./UCI HAR Dataset/test/subject_test.txt")

#combines the data with the labels and subject id for test and training data
testdata <- cbind(test_s, test_y, test_x)
traindata <- cbind(train_s, train_y, train_x)

#merges the training and testing data into one data set
dataMerge <- rbind(testdata, traindata)



#### Step 2: Extracts only the measurements on the mean and standard deviation for each measurement ####

#assign column names from the features data for the original test and training x data
features <- read.table("./UCI HAR Dataset/features.txt")
names(dataMerge) <- c("subject", "activity", features[,2])

#from column names we can extract the mean() and std() related columns and select them
colindex <- grep(".*(mean()|std()).*", names(dataMerge))
MeanAndStd <- dataMerge[,c(1,2,colindex)]   



#### Step 3: Uses descriptive activity names to name the activities in the data set ####

#activity_labels.txt contains the values for each label under the "activity" column
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")

#merges the activity labels by activityID which now adds descriptive names to each activity
MeanAndStd[["activity"]] <- factor(MeanAndStd[["activity"]],
                                     levels = activity_labels[[1]],
                                     labels = activity_labels[[2]])



##### Step 4: Appropriately labels the data set with descriptive variable names #####


##Already completed this in STEP 2 when naming all our columns##



#### Step 5: Create a tidy data set with the average of each variable for each activity and each subject ####

#groups, summarizes, and reorders the data into the tidy dataset we need
data_summary <- MeanAndStd %>%
        group_by(subject, activity) %>%
        summarise_all(list(mean)) %>%
        arrange(subject, activity)

#renames the variables to indicate they are averages
new_col <- lapply(names(data_summary), function(x) ifelse(x == "activity" || x == "subject", x, paste(x,"(Avg)", sep = " ")))
names(data_summary) <- c(new_col)

#writes our analysis output to a txt file
write.table(data_summary, "summary_data.txt", row.names = FALSE)
message("Analysis Successfully Run! Output: summary_data.txt")






