############################################
## To use this script :
##   1. Save it in your working directory
##   2. Run : source("plot4.R")
## ...The code can take a bit long to run...
############################################

library(downloader)
library(dplyr)

#------------------------------------------------------
# Downloading, unzipping and reading the data
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download(url, dest="dataset.zip", mode="wb") 
unzip("dataset.zip", exdir = "./")
table <- read.table("household_power_consumption.txt", 
                    header=TRUE, sep=";", na.strings="?")

#------------------------------------------------------
# Subsetting the dataset and formatting the dates and times
table <- na.omit(filter(table, Date=="1/2/2007" | Date=="2/2/2007"))
time <- strptime(paste(table$Date, table$Time), format="%d/%m/%Y %H:%M:%S")

#------------------------------------------------------
# Plotting and saving the graphic as a png file
png("plot4.png")
par(mfrow=c(2,2))

#-------------------
# Top left
plot(time, table$Global_active_power,
     ylab="Global Active Power", xlab="", type="l")
#-------------------
# Top right
plot(time, table$Voltage,
     ylab="Voltage", xlab="datetime", type="l")
#-------------------
# Bottom left
plot(time, table$Sub_metering_1, type="l", 
     ylab="Energy sub metering",
     xlab="")
lines(time, table$Sub_metering_2, type="l", col="red")
lines(time, table$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), 
       lty=c(1, 1, 1), col=c("black", "blue", "red"), bty="n")
#-------------------
# Bottom right
plot(time, table$Global_reactive_power,
     ylab="Global_reactive_power", xlab="datetime", type="l")

dev.off()
