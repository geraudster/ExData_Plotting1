loadDataFile <- function() {
    if(!file.exists("data")) {
        dir.create("data")
    }
    
    if(!file.exists("data/household_power_consumption.zip")) {
        download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
                      "data/household_power_consumption.zip",
                      method='curl')
        
    }
    
    unzip("data/household_power_consumption.zip", exdir="data")
}

loadData <- function() {
    data <- fread("data/household_power_consumption.txt", na.strings="?")
    subdata <- copy(data[Date == "1/2/2007" | Date == "2/2/2007",])
    subdata[, DateTime := as.POSIXct(strptime(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"))]
    subdata[, Global_active_power := as.numeric(Global_active_power)]
    subdata[, Global_reactive_power := as.numeric(Global_reactive_power)]
    subdata[, Voltage := as.numeric(Voltage)]
    subdata[, Global_intensity := as.numeric(Global_intensity)]
    subdata[, Sub_metering_1 := as.numeric(Sub_metering_1)]
    subdata[, Sub_metering_2 := as.numeric(Sub_metering_2)]
    subdata
}