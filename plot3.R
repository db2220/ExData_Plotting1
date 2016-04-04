plot3 <- function(fPath, outputDir = ""){
  
  # first lets call the getData function to read in the data
  subsetData <- prepData(fPath)
  
  # open a bitmapped formatted file with a width and height of 480 pixels,
  # which is the default size
  png(file = "plot3.png")
  
  
  # create the plot of all three Sub metering data over the two day period set
  # in the prepData function
  
  # first plot Sub_metering_1
  plot(subsetData$DateTime, subsetData$Sub_metering_1, type = "l",
       xlab = "", ylab = "Energy sub metering")
  
  # add Sub_metering_2
  with(subsetData, points(DateTime, Sub_metering_2, type = "l", col = "red"))
  
  # add Sub_metering_3
  with(subsetData, points(DateTime, Sub_metering_3, type = "l", col = "blue"))
  
  legend("topright", pch = "-", col = c("black", "red", "blue"),
         legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  
  # close the bitmapped device file
  dev.off()
}