#### From the original UCI HAR Dataset 
 
* test  
    * subject_test.txt
    * X_test.txt
    * Y_test.txt
* train
    * subject_train.txt
    * X_train.txt
    * Y_train.txt
* activity_labels.txt
* Features.txt
  
#### Outline of run_analysis.R  
1 Read the data Features.txt into Features  
2 Use grep to find the columns which contain "mean()" or "std()"  
3 Read X\_test.txt and X\_train.txt into X\_test and X\_train  
4 Combine X\_test and X\_train into X  
5 Read Y\_test.txt and Y\_train.txt into Y\_test and Y\_train  
6 Combine Y\_test and Y\_train into Y  
7 Add a column of row numbers to allow re-sorting later
8 Read subject\_test.txt and subject\_train.txt into subject\_test and subject\_train  
9 Combine subject\_test and subject\_train into subjects
10 Read activity\_labels.txt into activity\_labels  
11 Use the values from Features to set the column names for X  
12 Remove unwanted characters from names \_ \( \)  
13 Remove unwanted columns  
14 Add Y and subjects to data frame X  
15 Tidy up the column names and remove unwanted columns  
16 Dataframe X contains the tidy data  
17 Find the mean of all variables using aggregate  
18 Write out the results dataframe  


#### Description of X and results  

Subject - Subject ID from 1:30    
Activity - Activity Description  

* WALKING  
* WALKING_UPSTAIRS  
* WALKING_DOWNSTAIRS  
* SITTING
* STANDING  
* LAYING  

Dataframe X contains raw data on multiple rows  
Dataframe results contains the average measurement for each subject and each activity.

Measurements

 tBodyAccXYZ  
 tGravityAccXYZ  
 tBodyAccJerkXYZ  
 tBodyGyroXYZ  
 tBodyGyroJerkXYZ  
 tBodyAccMag  
 tGravityAccMag  
 tBodyAccJerkMag  
 tBodyGyroMag  
 tBodyGyroJerkMag  
 fBodyAccXYZ  
 fBodyAccJerkXYZ  
 fBodyGyroXYZ  
 fBodyAccMag  
 fBodyAccJerkMag  
 fBodyGyroMag  
 fBodyGyroJerkMag  

mean and std of the 66 measurement variables in the experiment  
-XYZ represent three variable, X Y and Z

Each dataframe has 66 variables  
( 8 * 3 XYZ variables + 9 Mag variable ) = 33 variables  
with mean and std for each of 33 variables, gives 66 measurements

Measurements are all real numbers, bounded between -1 and 1  