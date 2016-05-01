#install.packages("data.table")
#library(data.table)

setwd("~/coursera/course4/Wk1/exdata/")

data <- read.table("power.txt", header = TRUE, sep = ";",
                   stringsAsFactors = FALSE, na.strings = "?",
                   colClasses = c("character", "character", rep("numeric",7)))

# convert date and time variables to Date/Time class
data$Time <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, "%d/%m/%Y")

# only use data from the dates 2007-02-01 and 2007-02-02
dates <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
data <- subset(data, Date %in% dates)

## Create the plot file
png("plot4.png", width=480, height=480)

## Set up the multi-plot 
par(mfrow=c(2,2))

## number 1
plot(data$Time, data$Global_active_power, xlab = "", ylab = "Global active power",
     type = "l")

## number 2
plot(data$Time, data$Voltage, xlab = "datetime", ylab = "Global active power",
     type = "l")

## number 3
plot(data$Time, data$Sub_metering_1, xlab = "", ylab = "Energy sub metering", 
     col = "black", type = "l")
lines(data$Time, data$Sub_metering_2, col = "red")
lines(data$Time, data$Sub_metering_3, col = "blue")

legend("topright", col = c("black", "red", "blue"),
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = 1)

## number 4
plot(data$Time, data$Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power",
     col = "black", type = "l")

dev.off()