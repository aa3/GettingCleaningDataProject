# Packages required
library(data.table)
library(reshape)

# Load data
subjtest <- read.table("./UCI HAR Dataset/test/subject_test.txt")
subjtrain <- read.table("./UCI HAR Dataset/train/subject_train.txt")

xtest <- read.table("./UCI HAR Dataset/test/X_test.txt")
ytest <- read.table("./UCI HAR Dataset/test/y_test.txt")
xtrain <- read.table("./UCI HAR Dataset/train/X_train.txt")
ytrain <- read.table("./UCI HAR Dataset/train/y_train.txt")

activities <- read.table("./UCI HAR Dataset/activity_labels.txt")
activities <- activities[,2]

features <- read.table("./UCI HAR Dataset/features.txt")
features <- features[,2]
features_mean_std <- grepl("mean|std", features)

# Variable names
names(xtest) <- features
names(xtrain) <- features

# Get observations for Mean and STD.  Activity names.
xtest <- xtest[,features_mean_std]
ytest[,2] <- activities[ytest[,1]]
xtrain <- xtrain[,features_mean_std]
ytrain[,2] <- activities[ytrain[,1]]

# Auxiliary names
names(subjtest) <- c("SubjectNumber")
names(subjtrain) <- c("SubjectNumber")
names(ytest) <- c("ActivityLabel", "ActivityName")
names(ytrain) <- c("ActivityLabel", "ActivityName")

# Prepare the "test" and "train" data sets
testfinal <- cbind(as.data.table(subjtest), ytest, xtest)
trainfinal <- cbind(as.data.table(subjtrain), ytrain, xtrain)

# Merge "test" and "train" data sets
merge <- rbind(testfinal, trainfinal)

# Prepare to "melt" and "melt" the resulting data set
meltlabels <- c("SubjectNumber", "ActivityLabel", "ActivityName")
meanlabels = setdiff(names(merge), meltlabels)
meltmerge <- melt(merge, id = meltlabels, measure.vars = meanlabels)

# Calculate the averages
final <- cast(meltmerge, SubjectNumber + ActivityName ~variable, mean)

# Output "TXT" file
write.table(final, file = "./final.txt", row.name=FALSE)
