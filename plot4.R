## A script to solve the questions asked in the first peer assignment for the course 'Exploratory Data Analysis'
## on coursera. 
## Author: Hassan, github: mrhash101
## Date: 8th May 2014
## Plot 4

##Reading data from the given file 
data<- read.table(file = "household_power_consumption.txt", sep = ";", na.strings="?", header=TRUE)

#converting Date from factor to Date
data[,"Date"]<- as.Date(data[,"Date"], format = "%d/%m/%Y")

#Subsetting data at the required dates
data_x<- subset(data, data$Date == "2007-02-01" | data$Date == "2007-02-02")

#Converting to proper classes
date.time <- strptime(paste(data_x$Date, data_x$Time), format='%Y-%m-%d %H:%M:%S')
data_x<- cbind(data_x, date.time)


##creating and writing plot to file
png(filename = "plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))

##plot 1
plot(data_x$Global_active_power~data_x$date.time, type = "l", ylab = "Global Active Power", xlab = NA)

##plot 2
plot(data_x$Voltage~data_x$date.time, type = "l", ylab = "Voltage", xlab = "datetime")

##plot 3
plot(data_x$Sub_metering_1~data_x$date.time, type = "l", ylab = "Energy Sub metering", xlab = NA)
lines(data_x$Sub_metering_2~data_x$date.time, col = "red")
lines(data_x$Sub_metering_3~data_x$date.time, col = "blue")
legend("topright", lty =1, col = c("black", "red", "blue"), legend = c("Sub metering 1", "Sub metering 2", "Sub metering 3"))

##plot 4
plot(data_x$Global_reactive_power~data_x$date.time, type = "l", ylab = "Global_reactive_power", xlab = "datetime")

dev.off()