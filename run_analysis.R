features = read.table(file= "~/R Documenti/UCI HAR Dataset/features.txt") #features

#test_set
X_test = read.table(file = "~/R Documenti/UCI HAR Dataset/test/X_test.txt", header = F, sep="")
names(X_test) = features$V2     #assegno le features all' X_test (3) - Uses descriptive activity names to name the activities in the data set

y_test = read.table(file = "~/R Documenti/UCI HAR Dataset/test/y_test.txt")         #test_label
names(y_test) = "Activity"      #(3) - Uses descriptive activity names to name the activities in the data set

#who carried out the experiment (test and train respectively)
subject_test = read.table(file = "~/R Documenti/UCI HAR Dataset/test/subject_test.txt")
names(subject_test) = "Subject" #(3) - Uses descriptive activity names to name the activities in the data set
levels(subject_test) = 1:30

#train_set
X_train = read.table(file = "~/R Documenti/UCI HAR Dataset/train/X_train.txt")
names(X_train) = features$V2    #(3) - Uses descriptive activity names to name the activities in the data set

y_train = read.table(file = "~/R Documenti/UCI HAR Dataset/train/y_train.txt")      #train_label
names(y_train) = "Activity"     #(3) - Uses descriptive activity names to name the activities in the data set

subject_train = read.table(file = "~/R Documenti/UCI HAR Dataset/train/subject_train.txt")
names(subject_train) = "Subject"#(3) - Uses descriptive activity names to name the activities in the data set
levels(subject_train) = 1:30
  

  
activity_labels = read.table("~/R Documenti/UCI HAR Dataset/activity_labels.txt")
levels(y_test) = activity_labels$V1
levels(y_train) = activity_labels$V1


train = cbind(X_train, subject_train, y_train)
test = cbind(X_test, subject_test, y_test)

#new column partition to 
train$Partition = "Train"
test$Partition = "Test"

#(1) - Merges the training and the test sets to create one data set
All = rbind(train, test)
All$Partition = as.factor(All$Partition)

#(4) - Appropriately labels the data set with descriptive variable names.
All$Activity = factor(All$Activity, labels = activity_labels$V2)

#index of mean and std features
i_mean = grep("mean",features$V2, ignore.case = TRUE)
i_sd = grep("std", features$V2, ignore.case = TRUE)

#(2) Extracts only the measurements on the mean and standard deviation for each measurement
i = c(i_mean, i_sd)
i = sort(i)

DataSet_Mean_Std = cbind(All[,i], All[, seq(561, ncol(All)-1)])
#head(DataSet_Mean_Std$Subject)


#(5) Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
TidyDF = aggregate( . ~ Activity + Subject, FUN=mean, data = DataSet_Mean_Std, na.action = na.omit)

write.table(file = "TidyDataSet.txt", x = TidyDF)
