# Comment out if needed
# install.packages("data.table")
library(data.table)

source("loadData.R")

# Retrieve and uncompress data if not already done
loadDataFile()

# Extract data for 1/2/2007 and 2/2/2007
# May output some warning, but it can be safely ignored for those dates
subdata <- loadData()

# Sample data
head(subdata)
summary(subdata)

# Plot
png(file = "plot4.png")
par(mfrow=c(2,2))
with(subdata, {
    ## Global Active Power
    plot(DateTime, Global_active_power, 
         ylab="Global Active Power", main="",
         xlab="", type="l")

    ## Voltage
    plot(DateTime, Voltage, 
         ylab="Voltage", main="",
         xlab="datetime", type="l")
    
    ## Sub_metering
    plot(DateTime, Sub_metering_1, 
         ylab="Energy sub metering", main="",
         xlab="", type="l")
    lines(DateTime, Sub_metering_2, 
          ylab="Energy sub metering", main="",
          xlab="", type="l", col="red")
    lines(DateTime, Sub_metering_3, 
          ylab="Energy sub metering", main="",
          xlab="", type="l", col="blue")
    legend("topright", lty = 1, col = c("black", "red", "blue"),
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
           bty = "n")

    ## Global reactive power
    plot(DateTime, Global_reactive_power, 
         ylab="Global_reactive_power", main="",
         xlab="datetime", type="l")
    
    })

dev.off()
