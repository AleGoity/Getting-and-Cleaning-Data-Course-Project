run_analysis.R requires to download the zip file and extract the data. 
Make sure to have all the files previous run the script.
Set the working director in thefolder UCI HAR Dataset. The script should set the working director in the proper folders to each step, if doesn't work properly you must do this manually using the command setwd().

run_analysis.R will generate a tidydata set starting from multiple files. Trough the following steps:
-Merges the training and the test sets to create one data set.-
-Extracts only the measurements on the mean and standard deviation for each measurement.
-Uses descriptive activity names to name the activities in the data set
-Labels the data set with descriptive variable names.
-From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

tidydata.txt is exported file, after all the step previously described.
