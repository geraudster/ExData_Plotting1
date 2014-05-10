# Comment out if needed
# install.packages("data.table")
library(data.table)

source("loadData.R")

loadDataFile()

subdata <- loadData()

head(subdata)
summary(subdata)

plot(subdata$Global_active_power ~ subdata$DateTime, col="Red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
