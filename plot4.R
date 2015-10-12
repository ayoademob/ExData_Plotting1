# First run the getConsumptionData() in the loadData.R script
# pass the returned dataset to the plot functions
# must have ggplot2 installed e.g. install.packages("ggplot2")
plot4 <- function(rawDT){
  # Load libraries
  library(ggplot2)
  library(scales) # to access breaks/formatting functions
  library(grid)
  
  # Construct the plot
  rawDT = data.frame(Datetime = strptime(paste(rawDT[,Date],rawDT[,Time]), format="%Y-%m-%d %H:%M:%S") 
                    ,rawDT
                    )
  # Divide drawing canvas into 4 (2 rows and 2 cols), set the margin
  # Column filled first
  par(mfcol = c(2, 2), mar = c(5, 4, 2, 1))
  # Plot
  with (rawDT,{plot(  Datetime,Global_active_power # Plot 1
                    , type='l'
                    , xlab=''
                    , ylab='Global Active Power (kilowatts)'
                    )
               
               plot( c(Datetime,Datetime,Datetime) # Plot 2
                    , c(Sub_metering_1, Sub_metering_2, Sub_metering_3)
                    , type='n'
                    , xlab=''
                    , ylab='Energy sub metering'
                    )
                  # plot the lines
                  lines(Datetime,Sub_metering_1)
                  lines(Datetime,Sub_metering_2, col='red')
                  lines(Datetime,Sub_metering_3, col='blue')
                  legend( 'topright'
                         , legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3')
                         , col=c('black','red','blue')
                         , lty=c(1,1,1)
                         , lwd = 1
                         , cex = 0.5
                         , y.intersp = 0.2
                         )

                plot(  Datetime,Voltage # Plot 3
                       , type='l'
                       , xlab='datetime'
                       , ylab='Voltage'
                )
                  
                plot(  Datetime,Global_reactive_power # Plot 4
                       , type='l'
                       , xlab='datetime'
                       , ylab='Global_reactive_power'
                )
                                  
              }
        )

  # save it to a PNG file with a width of 480 pixels and a height of 480 pixels.
  dev.copy(png,'plot4.png', width = 480, height = 480)
  dev.off()
  #rawDT
}