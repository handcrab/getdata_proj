#setwd('.')
# Download and unzip file if it's not exists
file.url = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
dir.name = "UCI HAR Dataset"

print('preparing the raw data...')
# TODO check if the files exists within the folder
if (!file.exists(dir.name)) {   
    tmp.file = tempfile()

    download.file(file.url, tmp.file, method='curl')
    unzip(tmp.file)
    unlink(tmp.file)
}

# 1. Merges the training and the test sets to create one data set.
print('merging the training and the test sets...')
x.train = read.table(file.path(dir.name, 'train', 'X_train.txt'))
x.test = read.table(file.path(dir.name, 'test', 'X_test.txt'))
x.data = rbind(x.train, x.test)

features.data = read.table(file.path(dir.name,'features.txt'))
colnames(features.data) = c("id", "feature")

colnames(x.data) = features.data$feature
remove(x.train, x.test, features.data)

# TODO same work for x(feature) and y(activity) data sets
y.train = read.table(file.path(dir.name, 'train', 'y_train.txt'))
y.test = read.table(file.path(dir.name, 'test', 'y_test.txt'))
y.data = rbind(y.train, y.test)
remove(y.train, y.test)
colnames(y.data) = "activity"

# subject data
subj.train = read.table(file.path(dir.name, 'train', 'subject_train.txt'))
subj.test = read.table(file.path(dir.name, 'test', 'subject_test.txt'))
subject.data = rbind(subj.train, subj.test)
remove(subj.train, subj.test)

colnames(subject.data) = "subject"
subject.data$subject = factor(subject.data$subject) 

# merge training, test, subject data
tidy.data = cbind(subject.data, y.data, x.data)
remove(subject.data, y.data, x.data)

# 2. Extract only the measurements on the mean and standard deviation for each measurement.
print("extracting the measurements on the mean and standard deviation...")
tidy.data = subset(tidy.data, select=c(1,2,grep("mean\\(|std\\(", colnames(tidy.data))))

# 3. Uses descriptive activity names to name the activities in the data set
print("working on the activity names...")
activity.labels = read.table(file.path(dir.name,'activity_labels.txt'))
colnames(activity.labels) = c("id", "activity")

tidy.data$activity = factor(tidy.data$activity, labels=activity.labels$activity) 
remove(activity.labels)

# 4. Appropriately labels the data set with descriptive variable names. 
print("tiding up the label names ...")
colnames(tidy.data) = gsub("[^[:alpha:][:digit:]]", '', colnames(tidy.data)) # "[-\\(\\)]"
colnames(tidy.data) = tolower(colnames(tidy.data))

# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
print("preparing the 2nd data set with the average of each variable...")
measured.data = subset(tidy.data, select=-c(subject, activity))
tidy.data.avg = aggregate(measured.data, by=list(subject=tidy.data$subject, activity=tidy.data$activity), FUN=mean, na.rm=T)
remove(measured.data)

print("saving the data set to 'tidy.csv' file...")
write.csv(tidy.data.avg, file="tidy.csv", row.names=FALSE, quote=FALSE)

print("-----")
print("DONE.")
