png(filename='plot1.png', height=480, width=480)
hist(dtsub$Global_active_power, col="Red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.off()