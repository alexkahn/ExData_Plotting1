# Plot 1

# this script will look for a data directory and see if there is a file inside
# that corresponds to the household_power_consumption.txt data file, if not it
# will download and unzip it. Then it will process the data, placing the objects
# in the global environment. 
source("../processData.R")

png(filename="myGraphics/plot1.png")
hist(data$Global_active_power, col="red", 
     xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()
