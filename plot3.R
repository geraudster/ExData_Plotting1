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

png(file = "plot3.png")
with(subdata, {
    plot(DateTime, Sub_metering_1, 
         ylab="Energy sub metering",
         xlab="", type="l")
    lines(DateTime, Sub_metering_2, 
         ylab="Energy sub metering",
         xlab="", type="l", col="red")
    lines(DateTime, Sub_metering_3, 
          ylab="Energy sub metering",
          xlab="", type="l", col="blue")
    legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    })

dev.off()
