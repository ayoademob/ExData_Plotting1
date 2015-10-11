# First run the getConsumptionData() in the loadData.R script
# pass the returned dataset to the plot functions
plot1 <- function(rawDT){
  # construct the plot histogram
  hist(rawDT$Global_active_power,
       xlab = "Global Active Power (kilowatts)", 
       main ="Global Active Power",
       col = "red",
       ylim = c(0,1200)
       )
  # save it to a PNG file with a width of 480 pixels and a height of 480 pixels.
  dev.copy(png,'plot1.png', width = 480, height = 480)
  dev.off()
}