plot2 <- function(fileName){
  
  # first lets call the getData function to read in the data
  subsetData <- prepData(fileName)
  
  # open a bitmapped formatted file with a width and height of 480 pixels,
  # which is the default size
  png(file = "plot2.png")
  
  # create the plot of Global Active Power over the two day period set
  # in the prepData function
  plot(subsetData$DateTime, subsetData$Global_active_power, type = "l", 
       xlab = "", ylab = "Global Active Power (kilowatts)")
  
  # close the bitmapped device file
  dev.off()
}