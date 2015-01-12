## This Script Plots a Histogram of Global Active Power for the dates 01-Feb-2007 to 02-Feb-2007

# This script assumes that the data file is in your workspace.
# also the script uses another script "readAndCleanDataScript.R" (created to add modularity and available in github repo) 
# to read the data from file and provide clean data frame for plotting purpose. 


## Plots the Histogram of Global Active Power for the dates 01-Feb-2007 to 02-Feb-2007
plot1 <- function(){

    # get data from file
    data <- getDataForPlot1()
    
    # load the package
    library(datasets)
    
    # create and open the graphic device
    png(filename = "plot1.png", width = 480, height = 480)
    
    #create the plot ont he device
    with(data,hist(data$Global_active_power, xlab = "Global Active Power (kilowatts)", col = "red", main = "Global Active Power"))    
    
    # close the device
    dev.off()
}


## get the Data Frame
getDataForPlot1 <- function(){
    
    source("readAndCleanDataScript.R")
    
    data <- getCleanData()
    
    data
}