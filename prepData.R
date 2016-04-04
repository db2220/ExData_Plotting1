prepData <- function(fileName){
  
  #load the dplyr library
  library("dplyr")
  
  d <- read.csv(fileName, sep = ";", na.strings = "?" )
  dt <- tbl_df(d)
  
 
  # subset the data to only get the dates 2007-02-01 and 2007-02-02
  subsetData <- subset(dt, 
                       as.Date(dt$Date, "%d/%m/%Y") >= as.Date("01/02/2007", "%d/%m/%Y") &
                         as.Date(dt$Date, "%d/%m/%Y") < as.Date("03/02/2007", "%d/%m/%Y"))
  
  # change the data type for the remaining columns (that require it), to numeric
  subsetData$Global_active_power <- as.numeric(subsetData$Global_active_power)
  subsetData$Global_reactive_power <- as.numeric(subsetData$Global_reactive_power)
  subsetData$Voltage <- as.numeric(subsetData$Voltage)
  subsetData$Global_intensity <- as.numeric(subsetData$Global_intensity)
  subsetData$Sub_metering_1 <- as.numeric(subsetData$Sub_metering_1)
  subsetData$Sub_metering_2 <- as.numeric(subsetData$Sub_metering_2)
  
  # combine the date and time columns and convert from factor to POSIXlt format
  subsetData$DateTime <- strptime(paste(subsetData$Date, subsetData$Time), 
                         "%d/%m/%Y %H:%M:%S")
  
  return(subsetData)
}