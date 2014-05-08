# plot 3
png(filename="myGraphics/plot3.png")
with(data, {
    plot(datetime, Sub_metering_1, type="l", col="black",
         xlab="",ylab="Energy sub metering")
    lines(datetime, Sub_metering_2, col="red")
    lines(datetime, Sub_metering_3, col="blue")
})
legend("topright", lty=1,col = c("black","red","blue"), 
       legend = names(data[,6:8]))
dev.off()