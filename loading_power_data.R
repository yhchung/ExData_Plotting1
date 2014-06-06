#setwd("~/Dropbox/Online_Course/BigDataTrack/ExploratoryDataAnalysis/Project1")

#Date;Time;Global_active_power;Global_reactive_power;Voltage;Global_intensity;Sub_metering_1;Sub_metering_2;Sub_metering_3
#16/12/2006;17:24:00;4.216;0.418;234.840;18.400;0.000;1.000;17.000
#16/12/2006;17:25:00;5.360;0.436;233.630;23.000;0.000;1.000;16.000

library(data.table)

startDate <- as.Date("2007-02-01", "%Y-%m-%d")
endDate <- as.Date("2007-02-02", "%Y-%m-%d")

hpc <- fread("./data/household_power_consumption.txt", header=TRUE, 
             na.strings="?", sep=";")[as.Date(Date, "%d/%m/%Y") >= startDate
                                      & as.Date(Date, "%d/%m/%Y") <= endDate]

head(hpc)
tail(hpc)

str(hpc)
summary(hpc)

sapply(hpc, mode)
sapply(hpc, class)

hpc1 <- hpc
data <- transform(hpc, 
                  Global_active_power = as.numeric(Global_active_power),
                  Global_reactive_power = as.numeric(Global_reactive_power),
                  Voltage = as.numeric(Voltage),
                  Global_intensity = as.numeric(Global_intensity),
                  Sub_metering_1 = as.numeric(Sub_metering_1),
                  Sub_metering_2 = as.numeric(Sub_metering_2),
                  Sub_metering_3 = as.numeric(Sub_metering_3))



