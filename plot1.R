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
png(file = "plot1.png")
with(subdata, {
    hist(Global_active_power, col="Red", xlab="Global Active Power (kilowatts)", main="Global Active Power")    
})
dev.off()

