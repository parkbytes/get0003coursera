## Getting and cleaning data 

* `README.md` - this file. Overall instructions for getting data, running the script, etc.
* `run_analysis.R`  - R script to analyse, clean and output the data
* `CodeBook.md`  - codebook for the tidy data  

### Sourcing the raw data and scripts
* download the file from link below and extract contents to a suitable location. 
    `https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip`
* Save R script `run_analysis.R` from this repo to your working directory.
* In R, set working directory to point to top level folder in extracted data . i.e. `UCI HAR Dataset`

  The code below may be used from with R Studio's command window to achieve the above.
```
    zipFile <- "getdata_projectfiles_UCI HAR Dataset.zip"
    if (!file.exists("zipFile")) {
        url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        download.file(url, destfile=zipFile)
    } 
    unzip(zipFile)
    
```
### Script Execution
From within R command window...
* source the supplied R script
* call the function run()
* when prompted, confirm (y/n) to question on working directory check
* wait for script execution to complete... progress messages are displayed. 
* verify `tidyDataset.txt` in working directory when complete
```
  source("run_analysis.R")
  run()
```
### Output data
* Cleaned data is output to `tidyDataset.txt` in R's working directory
* Refer CodeBook.md for details on output data

For more info......this is only a course project! Thanks for your assessment.