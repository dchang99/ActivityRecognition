run_analysis <- function() {
        
        # Read variable names
        headers <- read.table("features.txt", col.names=c("id", "name"), 
                      colClasses=c("integer", "character"))

        # Read test and train data sets
        dataTest <- read.table("./test/X_test.txt", colClasses="numeric")
        dataTrain <- read.table("./train/X_train.txt", colClasses="numeric")
        
        # Assign variable names to corresponding column names of test 
        # and train data sets
        names(dataTest) <- headers$name
        names(dataTrain) <- headers$name
        
        # Read activity identifiers
        activitiesTest <- read.table("./test/y_test.txt", col.names="activityId", 
                                     colClasses="integer")
        activitiesTrain <- read.table("./train/y_train.txt", col.names="activityId", 
                                      colClasses="integer")
        
        # Read subject identifiers
        subjectTest <- read.table("./test/subject_test.txt", col.names="subjectId", 
                                  colClasses="integer")
        subjectTrain <- read.table("./train/subject_train.txt", col.names="subjectId", 
                                   colClasses="integer")
        
        # Bind subject, activity, and motion data
        dataTest <- cbind(subjectTest, activitiesTest, dataTest)
        dataTrain <- cbind(subjectTrain, activitiesTrain, dataTrain)
        
        # Filter columns containing mean() and std() values
        colSet <- c("subjectId", "activityId", 
                    grep("(mean|std)\\(\\)", headers$name, 
                         ignore.case=TRUE, value=TRUE))
        dataTest <- dataTest[, colSet]
        dataTrain <- dataTrain[, colSet]
        
        # Combine test and train data
        data <- rbind(dataTest, dataTrain)
        
        # Remove parentheses from column names for compatibility
        names(data) <- gsub("()", "", names(data), fixed=TRUE)
        # Expand "t" and "f" in variable names to "time" and "freq" 
        # for readability
        names(data) <- gsub("^t", "time", names(data))
        names(data) <- gsub("^f", "freq", names(data))
        
        # Read activity labels
        labels <- read.table("activity_labels.txt", col.names=c("id", "name"), 
                             colClasses=c("integer", "character"))
        
        # Assign activity labels as level names for activityId        
        data$activityId <- as.factor(data$activityId)
        levels(data$activityId) <- labels$name
        
        # Output mean of each variable grouped by subject and activity
        aggregate(data[,-(1:2)], FUN=mean,
                  by=list(subjectId=data$subjectId, activityId=data$activityId))
}
