# Plot 2
png(filename="myGraphics/plot2.png")
plot(data$datetime,data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()