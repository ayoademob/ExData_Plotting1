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
  tmp = ggplot(rawDT, aes(Date, Data1,fill="Sub_metering_1")) +
        geom_line() + # first plot  
        geom_line(data=rawDT,aes(Date, Data2,fill="Sub_metering_2"),colour = 'red') + # add second plot
        geom_line(data=rawDT,aes(Date, Data3,fill="Sub_metering_3"),colour = 'blue') + # add third plot
        scale_x_datetime(breaks = date_breaks("1 day")
                         ,labels = date_format("%a") 
                        ) + # format x axes
        xlab("") +
        ylab("Energy sub metering") +
        scale_linetype_discrete(name = "") +
        theme_bw() +
        theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())
        #theme(panel.background = element_rect(fill = 'white', colour = 'black'))
        # add legends
        #theme(legend('topright', legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),col=c('black','red','blue'),lty=1))
        #legend('topright', legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),col=c('black','red','blue'),lty=1)
  print(tmp)

  # save it to a PNG file with a width of 480 pixels and a height of 480 pixels.
  dev.copy(png,'plot3.png', width = 480, height = 480)
  dev.off()
  #rawDT
}