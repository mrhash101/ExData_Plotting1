## A script to solve the questions asked in the first peer assignment for the course 'Exploratory Data Analysis'
## on coursera. 
## Author: Hassan, github: mrhash101
## Date: 8th May 2014
## Plot 1


##Reading data from the given file 
data<- read.table(file = "household_power_consumption.txt", sep = ";", na.strings="?", header=TRUE)

#converting Date from factor to Date
data[,"Date"]<- as.Date(data[,"Date"], format = "%d/%m/%Y")

#Subsetting data at the required dates
data_x<- subset(data, data$Date == "2007-02-01" | data$Date == "2007-02-02")

#converting Time from factor to Time - does not work
#data_x[,"Time"]<- strptime(data_x[,"Time"], format = "%H:%M:%S")

#Converting to proper classes
date.time <- strptime(paste(data_x$Date, data_x$Time), format='%Y-%m-%d %H:%M:%S')
data_x<- cbind(data_x, date.time)

#Opening file connection, writing graph, and closing file connection
png(filename = "plot1.png", width = 480, height = 480)
hist(data_x$Global_active_power, main = "Global Active Power", xlab = "Global Active Power(Kilowatts)", col = "red")
dev.off()
