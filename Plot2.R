## Set working directory
setwd("C:/Users/vrays/Documents/R")

## Read table
table2 <- read.csv("household_power_consumption.txt", header = T, sep = ';', 
                      na.strings = "?", nrows = 2075259, check.names = F, 
                      stringsAsFactors = F, comment.char = "", quote = '\"')
table2$Date <- as.Date(table2$Date, format = "%d/%m/%Y")

## Subset the data
subsetdata <- subset(table2, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(table2)

## Convert dates
datetime <- paste(as.Date(subsetdata$Date), subsetdata$Time)
subsetdata$Datetime <- as.POSIXct(datetime)

## Open device
png(filename="plot2.png")

## Make Plot 2
plot(subsetdata$Global_active_power ~ subsetdata$Datetime, type = "l",
     ylab = "Global Active Power (kilowatts)", xlab = "")

## Close device
dev.off()