#-------------------------------------------------------------------------------
# processData.R
# Process the Household Power Consumption Data if it exists in a data directory,
# download the data from the url contained in data_file_url if not.
# Author: Alex Kahn
#-------------------------------------------------------------------------------

# Require a clean work environment
rm(list=ls())
graphics.off()

# Machine specific setting
setwd("~/Coursera/Exploratory Data Analysis/ExData_Plotting1")

# Check the data exists, if not download and unzip it.
data_file <- "./data/household_power_consumption.txt"
data_file_url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

if(!file.exists("./data")) {dir.create("./data")}
if(!file.exists("./data/household_power_consumption.txt")) {
    download.file(data_file_url, 
                  destfile="./data/exdata_data_household_power_consumption.zip")
    unzip("./data/exdata_data_household_power_consumption.zip")
}

# Read data
Power <- read.table(data_file, header=TRUE, sep=";", stringsAsFactors=FALSE)

# Combine the Date and Time columns
datetime_string <- paste(Power$Date, Power$Time, sep=" ")

# Convert to date objects
datetime <- strptime(datetime_string, format="%d/%m/%Y %T")
date <- as.Date(datetime)

# Generate an index for where our data of interest lives.
day1 <- which(date %in% as.Date("2007-02-01", format="%Y-%m-%d"))
day2 <- which(date %in% as.Date("2007-02-02", format="%Y-%m-%d"))
dates_index <- c(day1,day2)

# Subset our initial data frame and create a new one with our datetime object.
Power <- Power[dates_index,]
data <- data.frame(datetime = datetime[dates_index], Power[,3:9])

# Do some type casting so our data will be numeric.
data[,2:8]<-sapply(data[,2:8],as.numeric)