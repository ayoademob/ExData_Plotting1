# First run the getConsumptionData() in the loadData.R script
# pass the returned dataset to the plot functions
# must have ggplot2 installed e.g. install.packages("ggplot2")
plot4 <- function(rawDT){
  # Load libraries
  library(ggplot2)
  library(scales) # to access breaks/formatting functions
  
  # construct the plot
  rawDT = data.frame(Datetime = strptime(paste(rawDT[,Date],rawDT[,Time]), format="%Y-%m-%d %H:%M:%S") 
                    ,rawDT
#                     ,Data1=rawDT[,Global_active_power]
#                     ,Data2=rawDT[,Sub_metering_1]
#                     ,Data3=rawDT[,Sub_metering_2]
#                     ,Data4=rawDT[,Sub_metering_3]
#                     ,Data5=rawDT[,Global_reactive_power]
#                     ,Data6=rawDT[,Voltage]
                    )
  par(mfcol = c(2, 2), mar = c(5, 4, 2, 2))

  with (rawDT,{plot(  Datetime,Global_active_power
                    , type='l'
                    , xlab=''
                    , ylab='Global Active Power (kilowatts)'
                    )
               
               plot( c(Datetime,Datetime,Datetime)
                    , c(Sub_metering_1, Sub_metering_2, Sub_metering_3)
                    , type='n'
                    , xlab=''
                    , ylab='Energy sub metering'
                    )
                  # plot the lines
                  #lines(year,defense,col=”red”,lwd=2.5)
                  lines(Datetime,Sub_metering_1)
                  lines(Datetime,Sub_metering_2, col='red')
                  lines(Datetime,Sub_metering_3, col='blue')
#                   legend( 'topright'
#                          , legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3')
#                          , col=c('black','red','blue')
#                          , lty=c(1,1,1)
#                          )

                plot(  Datetime,Voltage
                       , type='l'
                       , xlab='datetime'
                       , ylab='Voltage'
                )
                  
                plot(  Datetime,Global_reactive_power
                       , type='l'
                       , xlab='datetime'
                       , ylab='Global_reactive_power'
                )
                                  
              }
        )
  

#   tmp = ggplot(rawDT, aes(Date, Data1,linetype="Sub_metering_1")) +
#         geom_line() + # first plot  
#         geom_line(data=rawDT,aes(Date, Data2,linetype="Sub_metering_2"),colour = 'red') + # add second plot
#         geom_line(data=rawDT,aes(Date, Data3,linetype="Sub_metering_3"),colour = 'blue') + # add third plot
#         scale_x_datetime(breaks = date_breaks("1 day")
#                          ,labels = date_format("%a") 
#                         ) + # format x axes
#         xlab("") +
#         ylab("Energy sub metering") +
#         scale_linetype_discrete(name = "") +
#         scale_shape_discrete(name="")+
#         theme_bw() +
#         theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())+
#         theme(legend.position=c(1.02, 1.02), legend.justification = c(1, 1),legend.background = element_rect(colour = "black")) 

        #legend('topright', legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),col=c('black','red','blue'),lty=1)
  #print(tmp)

  # save it to a PNG file with a width of 480 pixels and a height of 480 pixels.
  dev.copy(png,'plot4.png', width = 480, height = 480)
  dev.off()
  #rawDT
}