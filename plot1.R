############################################
## To use this script :
##   1. Save it in your working directory
##   2. Run : source("plot1.R")
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
# Subsetting the dataset 
table <- na.omit(filter(table, Date=="1/2/2007" | Date=="2/2/2007"))

#------------------------------------------------------
# Plotting and saving the graphic as a png file
png("plot1.png")
hist(table$Global_active_power, 
     main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
dev.off()