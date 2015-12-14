png(filename='plot2.png', height=480, width=480)
plot(dtsub$Global_active_power~as.POSIXct(dtsub$Time), type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.off()