#setwd("~/Dropbox/Online_Course/BigDataTrack/ExploratoryDataAnalysis/Project1")

loadData <- function () {

library(data.table)

dir = "~/Dropbox/Online_Course/BigDataTrack/ExploratoryDataAnalysis/Project1/data/"
file = "household_power_consumption.txt"

startDate <- as.Date("2007-02-01", "%Y-%m-%d")
endDate <- as.Date("2007-02-02", "%Y-%m-%d")

hpc <- fread(paste0(dir,file), header=TRUE, 
             na.strings="?", sep=";")[as.Date(Date, "%d/%m/%Y") >= startDate
                                      & as.Date(Date, "%d/%m/%Y") <= endDate]

data <- transform(hpc, 
                  Global_active_power = as.numeric(Global_active_power),
                  Global_reactive_power = as.numeric(Global_reactive_power),
                  Voltage = as.numeric(Voltage),
                  Global_intensity = as.numeric(Global_intensity),
                  Sub_metering_1 = as.numeric(Sub_metering_1),
                  Sub_metering_2 = as.numeric(Sub_metering_2),
                  Sub_metering_3 = as.numeric(Sub_metering_3))

# strptime didn't work...
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")

data
}
