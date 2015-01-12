## THe script assumes that the zip file has been downloaded and unzipped in the 'data' folder.


## Read and clean data 
getCleanData <- function(){
    
    # read data from file
    
    totalNumOfRowsToRead = 48 * 60 # 48 hours for 2 days and 60 samples per hour 
    
    filedataFiltered <- read.table("./data/household_power_consumption.txt" , header = F, sep = ";", na.strings = "?", nrows = totalNumOfRowsToRead, skip = 66637)
    
    # Add headers
    headers <- read.table("./data/household_power_consumption.txt" , header = T, sep = ";", na.strings = "?", nrows = 1)
    
    names(filedataFiltered) <- names(headers)
    
    # return data frame
    filedataFiltered    
}