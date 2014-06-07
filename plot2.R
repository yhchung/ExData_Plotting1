# a data loading function is in a seperate R file
#source("loading_power_data.R")
#data <- loadData()

dev.new()

plot(data$Global_active_power ~ data$DateTime, type="l",
     xlab="", ylab="Global Active Power (kilowatts)")

dev.copy(png, filename="plot2.png", width=480, height=480) # PNG file output
dev.off()
