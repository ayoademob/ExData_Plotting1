# First run the getConsumptionData() in the loadData.R script
# pass the returned dataset to the plot functions
# must have ggplot2 installed e.g. install.packages("ggplot2")
plot2 <- function(rawDT){
  # Load libraries
  library(ggplot2)
  library(scales) # to access breaks/formatting functions
  
  # construct the plot
  rawDT = data.frame(Date = strptime(paste(rawDT[,Date],rawDT[,Time]), format="%Y-%m-%d %H:%M:%S"), 
                    Data=rawDT[,Global_active_power])
#   rawDT = data.frame(Date = rawDT[,Date], 
#                      Data=rawDT[,Global_active_power])
#   
  tmp = ggplot(rawDT, 
                aes(Date, Data)) + 
        geom_line() +
        #geom_point(data = data.frame())+
        scale_x_datetime(breaks = date_breaks("1 day")
                         ,labels = date_format("%a") 
                        )+ 
        xlab("") + 
        ylab("Global Active Power")
  
  print(tmp)
  # save it to a PNG file with a width of 480 pixels and a height of 480 pixels.
  dev.copy(png,'plot2.png', width = 480, height = 480)
  dev.off()
  #rawDT
}