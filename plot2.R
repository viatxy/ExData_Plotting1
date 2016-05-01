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
png("plot2.png", width=480, height=480)

plot(data$Time, data$Global_active_power, type = "l",
                xlab = "",
                ylab = "Global Active Power(kilowatts)")
                

dev.off()