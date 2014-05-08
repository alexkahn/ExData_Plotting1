# Plot 4

# this script will look for a data directory and see if there is a file inside
# that corresponds to the household_power_consumption.txt data file, if not it
# will download and unzip it. Then it will process the data, placing the objects
# in the global environment. 
source("../processData.R")

png(filename="myGraphics/plot4.png")
par(mfrow=c(2,2))
with(data, {
    plot(datetime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
    plot(datetime, Voltage, ylab="Voltage", type="l")
    plot(datetime, Sub_metering_1, type="l", col="black",
         xlab="",ylab="Energy sub metering")
    lines(datetime, Sub_metering_2, col="red")
    lines(datetime, Sub_metering_3, col="blue")
    legend("topright", bty="n", lty=1,col = c("black","red","blue"), 
           legend = names(data[,6:8]))
    plot(datetime, Global_reactive_power, type="l")
})
dev.off()