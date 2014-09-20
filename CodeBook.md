## Transformations
The [run_analysis.R](run_analysis.R) script:
 
* reads and merges `train/X_train.txt`, `test/X_test.txt` data sets into the `x.data`, and uses feature names from `features.txt` to name its columns

* reads and merges `train/y_train.txt`, `test/y_test.txt` data sets into the `y.data`, and names the column as 'activity'

* reads and merges `train/subject_train.txt`, `test/subject_test.txt` data sets into the `subject.data`, names the column as 'subject', and converts the column to the factor

* merges all the three datasets (`subject.data`, `y.data`, `x.data`) into the `tidy.data` set

* using the regular expression on `tidy.data` column names extracts only the measurements on the mean and standard deviation for each measurement and saves it back in `tidy.data`

* converts activity column of `tidy.data` set to the factor and uses `activity_labels.txt` data as the factor labels

* processes the column names of `tidy.data` by removing all non-letter and non-digit symbols, and converting the names to lower case

* from the `tidy.data` set, creates `tidy.data.avg` - tidy data set with the average of each variable for each activity and each subject.

* saves the `tidy.data.avg` as csv-file


## Variables
[tidy.csv](tidy.csv) - tidy data set with the average of each feature variable for each activity and each subject.

- subject - identifies the subject who performed the activity for each window sample. Its range is from 1 to 30 (integer).

- activity - 1 of 6 activities during which the feature was measured: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING (string)

- features - mean of the given feature variable by subject and activity (numeric):
  - tbodyaccmeanx
  - tbodyaccmeany
  - tbodyaccmeanz
  - tbodyaccstdx
  - tbodyaccstdy
  - tbodyaccstdz
  - tgravityaccmeanx
  - tgravityaccmeany
  - tgravityaccmeanz
  - tgravityaccstdx
  - tgravityaccstdy
  - tgravityaccstdz
  - tbodyaccjerkmeanx
  - tbodyaccjerkmeany
  - tbodyaccjerkmeanz
  - tbodyaccjerkstdx
  - tbodyaccjerkstdy
  - tbodyaccjerkstdz
  - tbodygyromeanx
  - tbodygyromeany
  - tbodygyromeanz
  - tbodygyrostdx
  - tbodygyrostdy
  - tbodygyrostdz
  - tbodygyrojerkmeanx
  - tbodygyrojerkmeany
  - tbodygyrojerkmeanz
  - tbodygyrojerkstdx
  - tbodygyrojerkstdy
  - tbodygyrojerkstdz
  - tbodyaccmagmean
  - tbodyaccmagstd
  - tgravityaccmagmean
  - tgravityaccmagstd
  - tbodyaccjerkmagmean
  - tbodyaccjerkmagstd
  - tbodygyromagmean
  - tbodygyromagstd
  - tbodygyrojerkmagmean
  - tbodygyrojerkmagstd
  - fbodyaccmeanx
  - fbodyaccmeany
  - fbodyaccmeanz
  - fbodyaccstdx
  - fbodyaccstdy
  - fbodyaccstdz
  - fbodyaccjerkmeanx
  - fbodyaccjerkmeany
  - fbodyaccjerkmeanz
  - fbodyaccjerkstdx
  - fbodyaccjerkstdy
  - fbodyaccjerkstdz
  - fbodygyromeanx
  - fbodygyromeany
  - fbodygyromeanz
  - fbodygyrostdx
  - fbodygyrostdy
  - fbodygyrostdz
  - fbodyaccmagmean
  - fbodyaccmagstd
  - fbodybodyaccjerkmagmean
  - fbodybodyaccjerkmagstd
  - fbodybodygyromagmean
  - fbodybodygyromagstd
  - fbodybodygyrojerkmagmean
  - fbodybodygyrojerkmagstd

### Naming: 
mean - Mean of the feature
std  - Standard deviation of the feature

> The features come from the accelerometer and gyroscope 3-axial raw signals t**Acc**-XYZ and t**Gyro**-XYZ. These time domain signals (prefix '**t**' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. 
Similarly, the acceleration signal was then separated into body and gravity acceleration signals (t**BodyAcc**-XYZ and t**GravityAcc**-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain **Jerk** signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAcc**Mag**, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the '**f**' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the **X**, **Y** and **Z** directions.

