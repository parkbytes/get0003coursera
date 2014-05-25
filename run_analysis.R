## Getting and Cleaning data - course project 
#
## script run_analysis.R that does the following:
#
#* Merges the training and the test sets to create one data set.
#* Extracts only the measurements on the mean and standard deviation for each measurement. 
#* Uses descriptive activity names to name the activities in the data set
#* Appropriately labels the data set with descriptive activity names. 
#* Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 


dirCheck <- function () {
    resp <- readline("Is Samsung data under working directory? [y/n]? ")
    if(tolower(substr(resp,1,1)) == "n") 
        stop("Please see README.md before continuing. Ending script..")

    dir.use <- getwd()  # expects data in working directory
    cat(paste0("\nChecking in ", dir.use,".." ))
    
    if (!file.exists(paste0(dir.use, "/features.txt"))) {
        cat(paste0("\n..Checking in ", dir.use,"/UCI HAR Dataset.." ))
        if(file.exists(paste0(dir.use, "/UCI HAR Dataset/features.txt"))) 
            dir.use <- paste0(dir.use, "/UCI HAR Dataset")  # this path also ok
        else
            stop("features.txt not found! Please see README.md for download instructions.")
    }
    dir.use  #return data directory
}

run <- function() {
    ## test existence of Samsung download data to begin with
    dir.use <- tryCatch({dirCheck()}, error = function(e) { stop(e)} )

    ## load requried data from files
    cat("\nreading all files....do not interrupt...")
    
    features <- read.table(paste0(dir.use,"/features.txt"), header=F, sep="", col.names=c("fid","fdesc" ))  
    meanstd.idx <- grep("-(mean|std)\\(\\)",features$fdesc)  # index vector for data extraction later
    features$fdesc <- tidyMe(features$fdesc)  # tidy up a bit! will use as column names shortly
    
    activities <- read.table(paste0(dir.use, "/activity_labels.txt"), header=F, sep="", col.names=c("aid","alabel" ))  
        
    X_test <- read.table(paste0(dir.use,"/test/X_test.txt"), col.names=features$fdesc, check.names=FALSE )  
    y_test <- read.table(paste0(dir.use,"/test/y_test.txt"), col.names="activityId" )
    subject_test <- read.table(paste0(dir.use,"/test/subject_test.txt"), col.names="subject" )
    
    X_train <- read.table(paste0(dir.use,"/train/X_train.txt"), col.names=features$fdesc, check.names=FALSE )  
    y_train <- read.table(paste0(dir.use,"/train/y_train.txt"), col.names="activityId" )
    subject_train <- read.table(paste0(dir.use,"/train/subject_train.txt"), col.names="subject" )
    cat("\nfinished loading...")

    ## 1. Merges the training and the test sets to create one data set.
    #
    cat("\n1. Merging datasets..")
    X <- rbind(X_test, X_train) # merged measurement set
    y <- rbind(y_test, y_train) # merged activities
    subject <- rbind(subject_test, subject_train) # merged subjects
    #merge.all <- cbind(X,y,subject)  # Uncomment line if all-in-one copy needed
    
    # ok to remove some objects and free memory. If required uncomment below two lines.
    #rm(X_test,y_test,subject_test,X_train,y_train,subject_train)
    #gc (reset=TRUE) 
    
    ## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
        
    cat ("\n2. Extracting mean and std measurements....")    
    # subset X dataset using index vector 'meanstd.idx' of mean and std... created during data load
    Xmeanstd <- X[, c(meanstd.idx)] 
   
    
    ## 3. Uses descriptive activity names to name the activities in the data set
    
    cat ("\n3. Adding activity names to merged y dataset....")    
    # some cleanup on the labels first
    activities$alabel <- sub("_", "", activities$alabel)  # remove the "-" 
    activities[2,2] <- substr(activities[2,2],1,9 )  # shorten to "WALKINGUP"
    activities[3,2] <- substr(activities[3,2],1,11 )  # shorten to "WALKINGDOWN"

    #add a new factor variable to y dataset with levels and names from activities
    y$activity <- factor(y$activityId, levels = activities$aid, labels = activities$alabel)
    #y$activity <- activities$alabel[match(y$activityId,activities$aid)]  # this also works
    
    
    ## 4. Appropriately labels the data set with descriptive names. 
    
    cat ("\n4. Labeling dataset....")    
    firstSet <- cbind(Xmeanstd, activity=y$activity, subject=subject$subject)
    
    ## 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
    
    cat ("\n5. Creating second tidy dataset....")
    secondSet <- aggregate(Xmeanstd,list(subject=subject$subject, activity=y$activity), mean)

    ## the summarisation may be done using data table package as well. Could be faster than using aggregate
    #require(data.table)
    #DT <- data.table(firstSet)
    #secondSet <- DT[, lapply(.SD, mean), by=c("activity","subject"), .SDcols=names(Xmeanstd)]

    cat ("\nwriting second dataset to file....")    
    write.table(secondSet, "tidyDataset.txt", sep="\t",quote=FALSE, row.names = FALSE)
    cat("\n", normalizePath("tidyDataset.txt"),"..ready for you!")

}

#helper function tidyMe
tidyMe <- function(myCharVector) {
    ## expects character vector and returns one of same length
    #  customised for feature description tidy up
    t <- tolower(myCharVector)  #lower case - not required but less typo errors when typing!
    t <- gsub("-","", t ) # remove "-"
    t <- gsub("\\(","", t ) # remove "("
    t <- gsub("\\)","", t ) # remove ")"
    t <- gsub(",","", t ) # remove ")"
    t <- sub("fbodybody","fbody", t ) # ok to remove the duplicate "body"
    t
}

