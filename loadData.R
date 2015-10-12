# To use the script, ensure the data file is in the sam folder as the script.
# Use the following command to source this script

getConsumptionData <- function(filename){
  # Get directories
  home_wd <- getwd()
  # load libraries
  library(data.table)
  library(dplyr)
  # read data
  rawDT<-fread(filename, na.strings="?", colClasses = c(rep("character",9)))
  # We will only be using data from the dates 2007-02-01 and 2007-02-02. 
  rawDT<-rawDT[rawDT$Date=="1/2/2007" | rawDT$Date=="2/2/2007",]
  rawDT<-mutate(rawDT
                ,Global_active_power=as.numeric(rawDT$Global_active_power)
                ,Date=as.Date(rawDT$Date, format="%d/%m/%Y")
                ,Sub_metering_1 = as.numeric(Sub_metering_1)
                ,Sub_metering_2 = as.numeric(Sub_metering_2)
                ,Sub_metering_3 = as.numeric(Sub_metering_3)
                )
  rawDT
}
