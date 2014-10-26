#  Data Science - Getting and Cleaning Data Project Submission
#
#  All input files read from the working directory
#    Measurement Data
#      X_test.txt
#      X_train.txt
#    Activity Data
#      Y_test.txt
#      Y_train.txt
#    Subjects
#      subject_test.txt
#      subject_train.txt
#    features.txt
#    activity_lables
#  Read Features data and decide which features are of interest - "mean()" or "std()"
Features <- read.table("./data/features.txt", header=FALSE)
sub <- grep(("mean\\(\\)|std\\(\\)"), Features$V2)
#
#  Read X data and combine test and train, retaining only features of interest   
X_test  <- read.table("./data/test/X_test.txt", header=FALSE)
X_train <- read.table("./data/train/X_train.txt", header=FALSE)
X <- rbind(X_test[, sub], X_train[,sub])
#
#  Read Y data and combine test and train, adding in a row number to retain original order
Y_test  <- read.table("./data/test/Y_test.txt", header=FALSE) 
Y_train <- read.table("./data/train/Y_train.txt", header=FALSE)
Y <- rbind(Y_test, Y_train)
Y <- cbind(row(Y), Y)
#
#  Read subject data and combine test and train
subject_test  <-  read.table("./data/test/subject_test.txt", header=FALSE)
subject_train <-  read.table("./data/train/subject_train.txt", header=FALSE)
subjects <- rbind(subject_test, subject_train)
#
#  read activity labels
activity_labels <- read.table("./data/activity_labels.txt",
                              header=FALSE, colClasses=c("integer", "character"))
#
#  Give X meaningful names, by removing "-" "(" and ")"
names(X) <- Features$V2[sub]
names(X) <- gsub("[-)(]", "", names(X), )
#
#  Give Y descriptive activity codes by merging with activity data, and return to original order 
Y <- merge(Y, activity_labels, by.x="V1", by.y="V1")
Y <- Y[with(Y, order(Y$"row(Y)")), ]
#
#  Tidy up Y by removing unnecessary column and giving meaningful names
Y <- Y[, -2]
names(Y) <- c("Code", "Activity")
#
#  Combine activity data Y with subjects and add to X. Tidy up column names 
X <- cbind(Y, subjects, X)
X <- X[, -1]
names(X)[2] <- "Subject"
#
#  Data frame X is the required tidy data
#
#  Find the average of the variables in X, by activity and subject 
results <- aggregate(X[, c(-1, -2)], X[, c("Subject", "Activity")], mean)
write.table(results, "./data/results.txt", row.names=FALSE)
#  