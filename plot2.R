## A script to solve the questions asked in the first peer assignment for the course 'Exploratory Data Analysis'
## on coursera. 
## Author: Hassan, github: mrhash101
## Date: 8th May 2014
## Plot 2


##Reading data from the given file 
data<- read.table(file = "household_power_consumption.txt", sep = ";", na.strings="?", header=TRUE)

#converting Date from factor to Date
#date.time <- strptime(paste(data$Date, data$Time), format='%d/%m/%Y %H:%M:%S')
#data<- cbind(data, date.time)

data[,"Date"]<- as.Date(data[,"Date"], format = "%d/%m/%Y")



#Subsetting data at the required dates
data_x<- subset(data, data$Date == "2007-02-01" | data$Date == "2007-02-02")

#Converting to proper classes
date.time <- strptime(paste(data_x$Date, data_x$Time), format='%Y-%m-%d %H:%M:%S')
data_x<- cbind(data_x, date.time)

#creating graphs and storing them in files
png(filename = "plot2.png", width = 480, height = 480)
plot(data_x$Global_active_power~data_x$date.time, type = "l", ylab = "Global Active Power(Kilowatts)", xlab = NA)
dev.off()
