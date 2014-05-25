## CodeBook.md

### About the study and raw data
Source data collected from the accelerometers from the Samsung Galaxy S smartphone is being used in this datascience course from Coursera. A full description is available at the site where the data was obtained: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

* Download link to raw data
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

 
###  variables, the data, and work performed for the clean up
File feature_info.txt accompanying the raw data describes the feature measures and variables estimated from them.

For the clean up exercise, the variables corresponding to the below estimates on features are only extracted.
* mean(): Mean value  
* std(): Standard deviation

Resulting variables are listed in table below. Note, the end-part of the names denotes a mean() or std() and applicable measurement axis `x,y,z`. 

Summarisation is performed on the variables by activity and subject to store the average value of a mean or standard deviation.

### Codebook for the tidy dataset output from run_analysis.R script.

|    | Variable             | Description  |  |   |
|----|----------------------|-------|---|---|
| 1  | subject              | Single number (`1 to 30`) identifying the subject person that participated in the study|  |   |
| 2  | activity             | Measured activity. One of `LAYING`, `SITTING`, `STANDING`, `WALKING`, `WALKINGDOWN`, `WALKINGUP`  |   |   |
| 3  | tbodyaccmeanx        | Computed average value of the feature measurement by activity and subject. See above for a general description of features. For example, `tbodyaccmeanx` represents the mean of the body acceleration along X axis over a time period. Same explanation applies for rest of variables below.  |   |   |
| 4  | tbodyaccmeany        |    |   |   |
| 5  | tbodyaccmeanz        |    |   |   |
| 6  | tbodyaccstdx         |    |   |   |
| 7  | tbodyaccstdy         |    |   |   |
| 8  | tbodyaccstdz         |    |   |   |
| 9  | tgravityaccmeanx     |    |   |   |
| 10 | tgravityaccmeany     |    |   |   |
| 11 | tgravityaccmeanz     |    |   |   |
| 12 | tgravityaccstdx      |    |   |   |
| 13 | tgravityaccstdy      |    |   |   |
| 14 | tgravityaccstdz      |    |   |   |
| 15 | tbodyaccjerkmeanx    |    |   |   |
| 16 | tbodyaccjerkmeany    |    |   |   |
| 17 | tbodyaccjerkmeanz    |    |   |   |
| 18 | tbodyaccjerkstdx     |    |   |   |
| 19 | tbodyaccjerkstdy     |    |   |   |
| 20 | tbodyaccjerkstdz     |    |   |   |
| 21 | tbodygyromeanx       |    |   |   |
| 22 | tbodygyromeany       |    |   |   |
| 23 | tbodygyromeanz       |    |   |   |
| 24 | tbodygyrostdx        |    |   |   |
| 25 | tbodygyrostdy        |    |   |   |
| 26 | tbodygyrostdz        |    |   |   |
| 27 | tbodygyrojerkmeanx   |    |   |   |
| 28 | tbodygyrojerkmeany   |    |   |   |
| 29 | tbodygyrojerkmeanz   |    |   |   |
| 30 | tbodygyrojerkstdx    |    |   |   |
| 31 | tbodygyrojerkstdy    |    |   |   |
| 32 | tbodygyrojerkstdz    |    |   |   |
| 33 | tbodyaccmagmean      |    |   |   |
| 34 | tbodyaccmagstd       |    |   |   |
| 35 | tgravityaccmagmean   |    |   |   |
| 36 | tgravityaccmagstd    |    |   |   |
| 37 | tbodyaccjerkmagmean  |    |   |   |
| 38 | tbodyaccjerkmagstd   |    |   |   |
| 39 | tbodygyromagmean     |    |   |   |
| 40 | tbodygyromagstd      |    |   |   |
| 41 | tbodygyrojerkmagmean |    |   |   |
| 42 | tbodygyrojerkmagstd  |    |   |   |
| 43 | fbodyaccmeanx        |    |   |   |
| 44 | fbodyaccmeany        |    |   |   |
| 45 | fbodyaccmeanz        |    |   |   |
| 46 | fbodyaccstdx         |    |   |   |
| 47 | fbodyaccstdy         |    |   |   |
| 48 | fbodyaccstdz         |    |   |   |
| 49 | fbodyaccjerkmeanx    |    |   |   |
| 50 | fbodyaccjerkmeany    |    |   |   |
| 51 | fbodyaccjerkmeanz    |    |   |   |
| 52 | fbodyaccjerkstdx     |    |   |   |
| 53 | fbodyaccjerkstdy     |    |   |   |
| 54 | fbodyaccjerkstdz     |    |   |   |
| 55 | fbodygyromeanx       |    |   |   |
| 56 | fbodygyromeany       |    |   |   |
| 57 | fbodygyromeanz       |    |   |   |
| 58 | fbodygyrostdx        |    |   |   |
| 59 | fbodygyrostdy        |    |   |   |
| 60 | fbodygyrostdz        |    |   |   |
| 61 | fbodyaccmagmean      |    |   |   |
| 62 | fbodyaccmagstd       |    |   |   |
| 63 | fbodyaccjerkmagmean  |    |   |   |
| 64 | fbodyaccjerkmagstd   |    |   |   |
| 65 | fbodygyromagmean     |    |   |   |
| 66 | fbodygyromagstd      |    |   |   |
| 67 | fbodygyrojerkmagmean |    |   |   |
| 68 | fbodygyrojerkmagstd  |    |   |   |