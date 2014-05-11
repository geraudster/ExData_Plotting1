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

png(file = "plot2.png")
with(subdata, {
    plot(DateTime, Global_active_power, 
          ylab="Global Active Power (kilowatts)", main="",
          xlab="", type="l")
})
dev.off()