## This Script Plots Energy Sub Metering over the day(s) for the dates 01-Feb-2007 to 02-Feb-2007

# This script assumes that the data file is in your workspace.
# also the script uses another script "readAndCleanDataScript.R" (created to add modularity and available in github repo) 
# to read the data from file and provide clean data frame for plotting purpose. 

## Plots the Energy Sub Metering over the days for the dates 01-Feb-2007 to 02-Feb-2007
plot3 <- function(){
    
    # get data from file
    data <- getDataForPlot3()
    
    # load the package
    library(datasets)
    
    # create and open the graphic device
    png(filename = "plot3.png", width = 480, height = 480)
    
    #create the plot ont he device
    with(data,plot(data$DateTime,data$Sub_metering_1,type = "l", col = "black" ,ylab = "Energy sub metering", xlab = ""))    
    lines(data$DateTime,data$Sub_metering_2,type = "l", col = "red")
    lines(data$DateTime,data$Sub_metering_3,type = "l", col = "blue")
    
    # add legend
    legend("topright", lty = 1, col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
    
    # close the device
    dev.off()
}


## get the Data Frame
getDataForPlot3 <- function(){
    
    source("readAndCleanDataScript.R")
    
    data <- getCleanData()
    
    # create a new col with combined date time value
    data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")     
    
    data
}