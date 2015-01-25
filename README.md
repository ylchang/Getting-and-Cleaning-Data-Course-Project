#Getting and Cleaning Data Project#

In this repo will can find the following three files for fulfilling the requirement of the course project: 
##1. run_analysis.R:
>The R script for execute the 5 steps listed by the project description.
##2. READ.md:
>It describes how the script work.

#How the script work?
>The script has 5 main sections for execute the 5 steps described by the project description. These 5 steps are:
>>a. Read data in "train" catagory and join them (subject, x and y) together by using cbind().

>>b. Read data in "test" catagory and join them (subject, x and y) together by using cbine().

>>c. Join the the results of a and b by using rbind. This is the result of "Step 1" in the project description. 

>>d. Read the feature list. Use this list to extract only the measurements on the mean and standard deviation for each measurement. This is the result of "Step 2" in the project description.

>>e. Read the activity list. Use this list to name the activities in the data set. This is the result of "Step 3" in the project description.

>>f. Modify the labels the data set with descriptive variable names. This is the result of "Step 4" in the project description.

>>g. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject. This is the result of "Step 5" in the project description.