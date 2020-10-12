# Getting-Data-Week-4
Assignment for getting data week 4
Info about the data:
x data are the sensor readings from smartphones worn by 30 subjects.
y data indicate the types of activities the subjects engaged in. Thre were total 6 activities: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, SITTING, STANDING, STANDING 
sub data is indicating the subjects. There were 30 subjects in total

Description of the code:

We first read the test and training datasets for x data, y data and subjects data. Then following the instructions of the assignment we wrote the code so that it 

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


Inorder to do this, we  combined the training and test datasets and only kept the columns/measurements on the mean and standard deviation

After this, we created a new dataset from the previous combined dataset with the selected columns such that it contains the average values for each activity and each subject.

Finally we exported that resulting dataset and uploaded to this github repository 
