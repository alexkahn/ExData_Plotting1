# plot 4
png(filename="plot4.png")
par(mfrow=c(2,2))
with(data, {
    plot(datetime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
    plot(datetime, Voltage, ylab="Voltage", type="l")
    plot(datetime, Sub_metering_1, type="l", col="black",
         xlab="",ylab="Energy sub metering")
    lines(datetime, Sub_metering_2, col="red")
    lines(datetime, Sub_metering_3, col="blue")
    plot(datetime, Global_reactive_power, type="l")
})
dev.off()