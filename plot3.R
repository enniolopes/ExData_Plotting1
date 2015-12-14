png(filename='plot3.png', height=480, width=480)
with(dtsub, {
  plot(Sub_metering_1~as.POSIXct(dtsub$Time), type='l',  xlab='', ylab='Global Active Power (kilowatts)')
  lines(Sub_metering_2~as.POSIXct(dtsub$Time), col='Red')
  lines(Sub_metering_3~as.POSIXct(dtsub$Time), col='Blue')
})
legend(col=c('black','red','blue'), lty=1, lwd=2, legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), 'topright')
dev.off()