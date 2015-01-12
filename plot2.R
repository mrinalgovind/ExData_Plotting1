## This Script Plots a Global Active Power consumption over the days for the dates 01-Feb-2007 to 02-Feb-2007

# This script assumes that the data file is in your workspace.
# also the script uses another script "readAndCleanDataScript.R" (created to add modularity and available in github repo) 
# to read the data from file and provide clean data frame for plotting purpose. 

## Plots the Global Active Power consumption over the days for the dates 01-Feb-2007 to 02-Feb-2007
plot2 <- function(){
    
    # get data from file
    data <- getDataForPlot2()
    
    # load the package
    library(datasets)
    
    # create and open the graphic device
    png(filename = "plot2.png", width = 480, height = 480)
    
    #create the plot ont he device
    with(data,plot(data$DateTime,data$Global_active_power,type = "l", ylab = "Global Active Power (kilowatts)", xlab = ""))    
    
    # close the device
    dev.off()
}


## get the Data Frame
getDataForPlot2 <- function(){
    
    source("readAndCleanDataScript.R")
    
    data <- getCleanData()
    
    # create a new col with combined date time value
    data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")     
    
    data
}