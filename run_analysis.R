#getting data assignment
library(dplyr)
#reading test data
test_x<- read.table('F:/R ASSIGNMENTS/datasciencecoursera/Learning/Getting Data/Week 4/UCI HAR Dataset/test/X_test.txt')
test_y<- read.table('F:/R ASSIGNMENTS/datasciencecoursera/Learning/Getting Data/Week 4/UCI HAR Dataset/test/y_test.txt')
test_sub<- read.table('F:/R ASSIGNMENTS/datasciencecoursera/Learning/Getting Data/Week 4/UCI HAR Dataset/test/subject_test.txt')

#reading training data
train_x<- read.table('F:/R ASSIGNMENTS/datasciencecoursera/Learning/Getting Data/Week 4/UCI HAR Dataset/train/X_train.txt')
train_y<- read.table('F:/R ASSIGNMENTS/datasciencecoursera/Learning/Getting Data/Week 4/UCI HAR Dataset/train/y_train.txt')
train_sub<- read.table('F:/R ASSIGNMENTS/datasciencecoursera/Learning/Getting Data/Week 4/UCI HAR Dataset/train/subject_train.txt')

#reading the features and activity_labels data. 
#features will our variables/columns in test_x 
features<- read.table('F:/R ASSIGNMENTS/datasciencecoursera/Learning/Getting Data/Week 4/UCI HAR Dataset/features.txt')
activity_labels<- read.table('F:/R ASSIGNMENTS/datasciencecoursera/Learning/Getting Data/Week 4/UCI HAR Dataset/activity_labels.txt')

#Step 1: merging test and training datasets
x<- rbind(test_x, train_x ) #we first combine the test and training x data
y<- rbind(test_y, train_y) #we combine the test and training y data. y is the data about the activities
subtotal<- rbind(test_sub, train_sub) #we combine the test and training subjects data

#Steps 2 and 3: giving descriptive names and extracting only the measurements on the mean and standard deviation for each measurement.

names(subtotal)<- 'Subjects' #renaming the variable for the combined subjects dataset
names(y)<- 'activity' #renaming the variable/column for the combined y dataset 
y$activity<- factor(y$activity, labels = as.character(activity_labels[,2])) #Using descriptive activity names to name the activities in the y data set on the basis of activites_labels dataset

#Extracting only the measurements on the mean and standard deviation for each measurement:.
chosen_var<- features[grep('mean()|std()', features[,2]),] #finding the variables on the mean and standard deviation 
chosenvariableindexes<- grep('mean()|std()', features[,2]) #finding indexes of the selected variables
x<- x[,chosenvariableindexes] #subsetting/extracting the measurements on the mean and standard deviation for each measurement in x
names(x)<- chosen_var[,2] #giving descriptive names to all the chosen/selected variables in x on the basis of features dataframe


total<- cbind(y, subtotal, x) #this is the final combined dataset at the end of step 4

#now we just need to find the average values of each variable  for each activity and each subject.

#Step 5: Creating a new dataset out of the one created in step 4 with the average of each variable for each activity and each subject.

new_total <- total %>% group_by(activity,Subjects) %>% summarise_each(funs = mean) #new_total is the new dataset we create in step 5

#final step: writing out/exporting the resulting dataset and
write.table(new_total, file = 'F:/R ASSIGNMENTS/datasciencecoursera/Learning/Getting Data/Week 4/UCI HAR Dataset/GettingDataAssignment.txt')



