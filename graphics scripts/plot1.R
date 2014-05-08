# Plot 1
# source(data script)
png(filename="plot1.png")
hist(data$Global_active_power, col="red", 
     xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()
