# a data loading function is in a seperate R file
#source("loading_power_data.R")
#data <- loadData()

dev.new()

par(mfrow=c(2,2), bg="transparent")

with(data, {
        plot(Global_active_power ~ DateTime, type="l",
             xlab="", ylab="Global Active Power", col="black")

        plot(DateTime, Voltage, type="l",
             xlab="datetime", ylab="Voltage", col="black")
        
        plot(DateTime, Sub_metering_1, type="l", col="black",
             xlab="", ylab="Energy sub metering")
        lines(DateTime, Sub_metering_2, col="red")
        lines(DateTime, Sub_metering_3, col="blue")
        legend("topright", lty=1, lwd=1, cex=0.8, 
               bty="n",
               y.intersp = 0.6,
               legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
               col=c("black", "red", "blue"))
        
        plot(DateTime, Global_reactive_power, type="l",
             xlab="datetime", ylab="Global_reactive_power", col="black")
        
})

dev.copy(png, filename="plot4.png", width=480, height=480) # PNG file output
dev.off()
