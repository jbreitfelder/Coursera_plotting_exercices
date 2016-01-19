############################################
## To use this script :
##   1. Save it in your working directory
##   2. Run : source("plot2.R")
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
png("plot2.png")
plot(time, table$Global_active_power,
     ylab="Global Active Power (kilowatts)", xlab="", type="l")
dev.off()