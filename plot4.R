plot4 <- function(fPath, outputDir = ""){
  
  # first lets call the getData function to read in the data
  subsetData <- prepData(fPath)
  
  # open a bitmapped formatted file with a width and height of 480 pixels,
  # which is the default size
  png(file = "plot4.png")
  
  # set up the 2x2 vector for the four plots to create
  par(mfrow = c(2,2), mar = c(4, 4, 1, 2))
  
  #first plot top row
  plot(subsetData$DateTime, subsetData$Global_active_power, type = "l", 
       xlab = "", ylab = "Global Active Power")
  
  # second plot top row
  plot(subsetData$DateTime, subsetData$Voltage, type = "l", 
       xlab = "datetime", ylab = "Voltage")
  
  # first plot bottom row
  plot(subsetData$DateTime, subsetData$Sub_metering_1, type = "l",
       xlab = "", ylab = "Energy sub metering")
  
  with(subsetData, points(DateTime, Sub_metering_2, type = "l", col = "red"))
  
  with(subsetData, points(DateTime, Sub_metering_3, type = "l", col = "blue"))
  
  legend("topright", pch = "_", bty = "n", col = c("black", "red", "blue"),
         legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  
  # second plot bottom row
  plot(subsetData$DateTime, subsetData$Global_reactive_power, type = "l", 
       xlab = "datetime", ylab = "Global_reactive_power")
  
  dev.off()
}