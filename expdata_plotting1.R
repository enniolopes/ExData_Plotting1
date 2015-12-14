#_____________________________________________
##Exploratory Data Analysis (DATA SCIENCE)
R.version.string #R version 3.2.3 (2015-08-14)
#_____________________________________________
setwd("./GitHub/ExData_Plotting1/")


#Course Project 1_____________________________

#Sample: data from the UC Irvine Machine Learning Repository, a popular repository 
#for machine learning datasets. In particular, we will be using the Individual 
#household electric power consumption Data Set

#Description: Measurements of electric power consumption in one household with a 
#one-minute sampling rate over a period of almost 4 years. Different electrical 
#quantities and some sub-metering values are available.

#estimated ram memory (MB):
2075259*9*8/(2^20) #142.4967

#Read file:
temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
data <- read.table(unz(temp, "household_power_consumption.txt"), sep=";", header=T, stringsAsFactors=F, na.strings="?", check.names=F, comment.char="", quote='\"')
unlink(temp)
rm(temp)
names(data)
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

#Subsetting form dates 2007-02-01 and 2007-02-02:
dtsub <- subset(data, subset=(Date >= '2007-02-01' & Date <= '2007-02-02'))
rm(data)
dtsub$Time <- paste(dtsub$Date, dtsub$Time, sep=" ")
dtsub$Time <- strptime(dtsub$Time, "%Y-%m-%d %H:%M:%S")
str(dtsub) ; head(dtsub)


#Making Plots

#Plot 1
png(filename='plot1.png', height=480, width=480)
hist(dtsub$Global_active_power, col="Red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.off()

#Plot 2
png(filename='plot2.png', height=480, width=480)
plot(dtsub$Global_active_power~as.POSIXct(dtsub$Time), type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.off()

#Plot 3
png(filename='plot3.png', height=480, width=480)
with(dtsub, {
  plot(Sub_metering_1~as.POSIXct(dtsub$Time), type='l',  xlab='', ylab='Global Active Power (kilowatts)')
  lines(Sub_metering_2~as.POSIXct(dtsub$Time), col='Red')
  lines(Sub_metering_3~as.POSIXct(dtsub$Time), col='Blue')
})
legend(col=c('black','red','blue'), lty=1, lwd=2, legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), 'topright')
dev.off()

#Plot 4
png(filename='plot4.png', height=480, width=480)
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(dtsub, {
  plot(Global_active_power~as.POSIXct(dtsub$Time), type="l", xlab="", ylab="Global Active Power (kilowatts)")
  plot(Voltage~as.POSIXct(dtsub$Time), type="l", xlab="", ylab="Voltage (volt)")
  plot(Sub_metering_1~as.POSIXct(dtsub$Time), type="l", xlab="", ylab="Global Active Power (kilowatts)")
      lines(Sub_metering_2~as.POSIXct(dtsub$Time),col='Red')
      lines(Sub_metering_3~as.POSIXct(dtsub$Time),col='Blue')
      legend(col=c("black", "red", "blue"), lty=1, lwd=2, bty="n", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), "topright")
  plot(Global_reactive_power~as.POSIXct(dtsub$Time), type="l", xlab="", ylab="Global Rective Power (kilowatts)")
})
dev.off()
