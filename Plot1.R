## Set working directory
setwd("C:/Users/vrays/Documents/R")

## Open connection to file
file1 <- file("household_power_consumption.txt")

## Read table
table1 <- read.table(text = grep("^[1,2]/2/2007", readLines(file1), value = TRUE), 
                     col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", 
                                   "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", 
                                   "Sub_metering_3"), sep = ";", header = TRUE)

## Open device
png(filename="plot1.png")

# Make Plot 1 (histogram)
hist(table1$Global_active_power, col = "red", main = paste("Global Active Power"), 
     xlab = "Global Active Power (kilowatts)")

## Close device
dev.off()