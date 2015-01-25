run_analysis <- function(){
  
  ##This script uses functions in "dplyr" library.
  
  library(dplyr)
  
  ##a. Read data in "train" catagory and join them (subject, x and y) together by using cbind()

  subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
  x_train <- read.table("./UCI HAR Dataset/train/x_train.txt")
  y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
  cbind_train <- cbind(subject_train,y_train,x_train)
  
  ##b. Read data in "test" catagory and join them (subject, x and y) together by using cbine()

  subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
  x_test <- read.table("./UCI HAR Dataset/test/x_test.txt")
  y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
  cbind_test <- cbind(subject_test,y_test,x_test)

  ##c. Join the the results of a and b by using rbind. This is the result of "Step 1" in the project description. 

  big_table <- rbind(cbind_test,cbind_train)

  ##d. Read the feature list. Use this list to extract only the measurements on the mean and standard deviation for each measurement.
  ##This is the result of "Step 2" in the project description. 

  features <- read.table("./UCI HAR Dataset/features.txt")
  good <- (grepl("mean\\(\\)",features[,2]))|(grepl("std\\(\\)",features[,2]))
  good_features <- features[good,]
  good_table <- big_table[,good]

  ##e. Read the activity list. Use this list to name the activities in the data set.
  ##This is the result of "Step 3" in the project description.
  
  activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
  good_table[,2] <- as.character(setNames(activity_labels[,2], activity_labels[,1])[as.character(unlist(good_table[,2]))])

  ##f. Modify the labels the data set with descriptive variable names.
  ##This is the result of "Step 4" in the project description.

  name1<- as.character(good_features[,2])
  name1 <- gsub("fBodyBody","fBody",name1)
  name1 <- gsub("tBody","Time Body ",name1)
  name1 <- gsub("fBody","Frequency Body ",name1)
  name1 <- gsub("tGravity","Time Gravity ",name1)
  name1 <- gsub("Acc","Acceleration ",name1)
  name1 <- gsub("Gyro","Gyro ",name1)
  name1 <- gsub("Jerk","Jerk ",name1)
  name1 <- gsub("Mag","Magnitude ",name1)
  name1 <- gsub("-mean\\(\\)","Mean ",name1)
  name1 <- gsub("-std\\(\\)","STD ",name1)
  names(good_table) <- c("Subject","Activity",name1)
  write.table(good_table, file = "good_table.txt",row.name = FALSE)

  ##From the data set in step 4, creates a second, independent tidy data set
  ##with the average of each variable for each activity and each subject.
  ##This is the result of "Step 5" in the project description.

  average_good_table <-good_table
  name1 <- gsub("Time","Average Time",name1)
  name1 <- gsub("Frequency","Average Frequency",name1)
  names(average_good_table) <- c("Subject","Activity",name1)
  average_good_table <- average_good_table %>% group_by(Subject, Activity) %>% summarise_each(funs(mean))
  write.table(average_good_table, file = "average_good_table.txt",row.name = FALSE)

}
