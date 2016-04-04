plot1 <- function(fileName){
  
  # first lets call the getData function to read in the data
  subsetData <- prepData(fileName)
  
  # open a bitmapped formatted file with a width and height of 480 pixels,
  # which is the default size
  png(file = "plot1.png")
  
  # create the histogram for frequency of Global Active Power
  hist(subsetData$Global_active_power, breaks = 25, col = "red", main = "Global Active Power", 
       xlab = "Global Active Power (kilowatts)")
  
  # close the bitmapped device file
  dev.off()
}