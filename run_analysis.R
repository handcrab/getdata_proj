# doesn't work with the current data.table verions 1.9.2: cann't read files that are missing values in first row
#install_github("Rdatatable/data.table", build_vignettes=FALSE)

#library(data.table)
#setwd('./')
# Download and unzip file if it's not exists
file.url = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
dir.name = "UCI HAR Dataset"

# TODO check if the files exists within the folder
if (!file.exists(dir.name)) {   
    tmp.file = tempfile()
    #file.arhive.name = paste("household_power_consumption.txt", '.zip')

    download.file(file.url, tmp.file, method='curl')
    unzip(tmp.file)
    #file.remove(file.arhive.name)
    unlink(tmp.file)
}

# features.txt
# activity_labels.txt


# 1. Merges the training and the test sets to create one data set.
#features.data = fread(file.path(dir.name,'features.txt'))
#labels.data = fread(file.path(dir.name,'activity_labels.txt'))

#setnames(labels.data, c('id', 'activity'))
#setnames(features.data, c('id', 'feature'))

# x.train = fread(file.path(dir.name, 'train', 'X_train.txt'), header=F)
# x.test = fread(file.path(dir.name, 'test', 'X_test.txt'), header=F)

labels.data = read.table(file.path(dir.name,'activity_labels.txt'))
colnames(labels.data) = c("id", "activity")

features.data = read.table(file.path(dir.name,'features.txt'))
colnames(features.data) <- c("id", "feature")

x.train = read.table(file.path(dir.name, 'train', 'X_train.txt'))
x.test = read.table(file.path(dir.name, 'test', 'X_test.txt'))

# Merge the training and the test data
x.data = rbind(x.train, x.test)
remove(x.train, x.test)
colnames(x.data) = features.data$feature

# Extract only the measurements on the mean and standard deviation for each measurement.
tmp.cols = grep("mean\\(|std\\(", features.data$feature)
x.data = x.data[, tmp.cols]

# makes column names more tidy
# colnames(x.data) = gsub("[-\\(\\)]", '', colnames(x.data))
colnames(x.data) = gsub("[^[:alpha:][:digit:]]", '', colnames(x.data))
colnames(x.data) = tolower(colnames(x.data))




