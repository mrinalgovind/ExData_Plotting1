## This Script Plots multiple plots related to electricity usage in 2 x 2 fashion for the dates 01-Feb-2007 to 02-Feb-2007

# This script assumes that the data file is in your workspace.
# also the script uses another script "readAndCleanDataScript.R" (created to add modularity and available in github repo) 
# to read the data from file and provide clean data frame for plotting purpose. 

## Plots multiple plots related to electricity usage in 2 x 2 fashion for the dates 01-Feb-2007 to 02-Feb-2007
plot4 <- function(){
    
    # get data from file
    data <- getDataForPlot4()
    
    # load the package
    library(datasets)
    
    # create and open the graphic device
    png(filename = "plot4.png", width = 480, height = 480)
    
    # set global value to plot graphs in mupltiple rows and cols
    par(mfrow = c(2,2))
    
    #create the plots on the device
    
    # plot1
    plot(data$DateTime,data$Global_active_power,type = "l", col = "black" ,ylab = "Global Active Power", xlab = "dateTime")
    
    #plot2
    plot(data$DateTime,data$Voltage,type = "l", col = "black" ,ylab = "Voltage", xlab = "dateTime")
    
    #plot3
    plot(data$DateTime,data$Sub_metering_1,type = "l", col = "black" ,ylab = "Energy sub metering", xlab = "")
    lines(data$DateTime,data$Sub_metering_2,type = "l", col = "red")
    lines(data$DateTime,data$Sub_metering_3,type = "l", col = "blue")
    legend("topright", lty = 1, col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), bty = "n", cex = .9)
    
    #plot4     
    plot(data$DateTime,data$Global_reactive_power,type = "l", col = "black" ,ylab = "Global_reactive_power", xlab = "dateTime")
    
    # close the device
    dev.off()
}


## get the Data Frame
getDataForPlot4 <- function(){
    
    source("readAndCleanDataScript.R")
    
    data <- getCleanData()
    
    # create a new col with combined date time value
    data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")     
    
    data
}