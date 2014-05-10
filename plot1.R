# Comment out if needed
# install.packages("data.table")
library(data.table)

source("loadData.R")

loadDataFile()

subdata <- loadData()

head(subdata)
summary(subdata)

hist(subdata$Global_active_power, col="Red", xlab="Global Active Power (kilowatts)", main="Global Active Power")

