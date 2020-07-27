#read files
setwd("../test/")
test_x<-read.table(file = "X_test.txt")
test_y<-read.table(file = "y_test.txt")
test_subject<-read.table("subject_test.txt")
setwd("../train/")
train_x<-read.table(file = "X_train.txt")
train_y<-read.table(file = "y_train.txt")
train_subject<-read.table("subject_train.txt")
#name of variables
variables<-read.table("features.txt")
variables_names<-variables[,2]
#1.Bind test data
test<-cbind(test_subject, test_y, test_x)
colnames(test)<-c("subject", "activity", variables_2)
#1.Bind train data
train<-cbind(train_subject, train_y, train_x)
colnames(train)<-c("subject", "activity", variables_2)
#1.bind train and test data
data<-rbind(train, test)
#2.Extracts only the measurements on the mean and standard deviation for each measurement
data_mean_SD<-select(data, subject, activity, contains("mean"), contains("std"))

#3.Uses descriptive activity names to name the activities in the data set
activity<-read.table("activity_labels.txt")
as.factor(data_mean_SD$activity)
a<-factor(data_mean_SD$activity, levels = 1:6, labels = activity[,2])
data_final<-mutate(data_mean_SD, activity=a)

#4.Appropriately labels the data set with descriptive variable names.
names(data_final)<-gsub("^t", "time", names(data_final))
names(data_final)<-gsub("^f", "frequency", names(data_final))
names(data_final)<-gsub("Acc", "Accelerometer", names(data_final))
names(data_final)<-gsub("Gyro", "Gyroscope", names(data_final))
names(data_final)<-gsub("Mag", "Magnitude", names(data_final))
names(data_final)<-gsub("BodyBody", "Body", names(data_final))

#5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

data_final_2<-aggregate(. ~subject + activity, data_final, mean)
data_final_2<-data_final_2[order(data_final_2$subject,data_final_2$activity),]
write.table(data_final_2, file = "tidydata.txt",row.name=FALSE)



