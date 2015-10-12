# First run the getConsumptionData() in the loadData.R script
# pass the returned dataset to the plot functions
# must have ggplot2 installed e.g. install.packages("ggplot2")
plot3 <- function(rawDT){
  # Load libraries
  library(ggplot2)
  library(scales) # to access breaks/formatting functions
  
  # construct the plot
  rawDT = data.frame(Date = strptime(paste(rawDT[,Date],rawDT[,Time]), format="%Y-%m-%d %H:%M:%S") 
                    #,Data=rawDT[,Global_active_power]
                    ,Data1=rawDT[,Sub_metering_1]
                    ,Data2=rawDT[,Sub_metering_2]
                    ,Data3=rawDT[,Sub_metering_3]
                    )
#   rawDT = data.frame(Date = rawDT[,Date], 
#                      Data=rawDT[,Global_active_power])
#   
  tmp = ggplot(rawDT, 
                aes(Date, Data1)) + 
        geom_line() +
        geom_line(data=rawDT,aes(Date, Data2),colour = 'red') +
        geom_line(data=rawDT,aes(Date, Data3),colour = 'blue') +
        #geom_point(data = data.frame())+
        scale_x_datetime(breaks = date_breaks("1 day")
                         ,labels = date_format("%a") 
                        )+ 
        xlab("") + 
        ylab("Energy sub metering")
  
  print(tmp)
  # save it to a PNG file with a width of 480 pixels and a height of 480 pixels.
  dev.copy(png,'plot3.png', width = 480, height = 480)
  dev.off()
  #rawDT
}