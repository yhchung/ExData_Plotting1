# a data loading function is in a seperate R file
source("loading_power_data.R")
data <- loadData()

dev.new()
par(bg="transparent")

hist(data$Global_active_power, col="red",
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)", ylab="Frequency")

dev.copy(png, filename="plot1.png", width=480, height=480) # PNG file output
dev.off()
dev.off()