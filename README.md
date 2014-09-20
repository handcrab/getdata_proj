# [Getting and Cleaning Data](https://www.coursera.org/course/getdata) Course Project #

The code of [run_analysis.R](run_analysis.R) file: 
- Downloads the required raw [Human Activity Recognition Using Smartphones Dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
- Merges the training and the test sets to create one data set.
- Extracts only the measurements on the mean and standard deviation for each measurement. 
- Set descriptive activity names to the activities in the data set
- Labels the data set with descriptive variable names. 
- Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Prerequisites ##
The working directory should be set to the location of [run_analysis.R](run_analysis.R) file.
The script relies on data sets in the directory called "UCI HAR Dataset", that should be created as the result of extraction from the downloaded archive

Required directory structure:
```
UCI HAR Dataset
├── activity_labels.txt
├── features.txt
├── test
│   ├── subject_test.txt
│   ├── X_test.txt
│   └── y_test.txt
└── train
    ├── subject_train.txt
    ├── X_train.txt
    └── y_train.txt

```

## Output ##
The result file that contains the tidy data set with the average of each variable for each activity and each subject will be saved as 'tidy.csv'

See the [CodeBook.md](CodeBook.md) file that explains the variables and what data transformations where done.
