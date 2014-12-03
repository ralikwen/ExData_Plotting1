fileName="household_power_consumption.txt"
data5row <- read.table(fileName, header = TRUE, nrows = 5, sep=';', stringsAsFactors=FALSE) 
classes <- sapply(data5row, class)
data <- read.table(fileName, header = TRUE, colClasses = classes, sep=';', na.strings = "?")
sdata <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]
sdata$DateTime<-strptime(paste (sdata$Date, sdata$Time), format = "%d/%m/%Y %H:%M:%S" )

png(file = "plot4.png", width = 480, height = 480, units = "px", pointsize = 12, bg = "white")
par(mfrow=c(2,2))
par("mar"=c(4,4,2,2))
plot(sdata$DateTime, sdata$Global_active_power, type="l",xlab="", ylab="Global ACtive Power")
plot(sdata$DateTime, sdata$Voltage, type="l",xlab="datetime", ylab="Voltage")
plot(sdata$DateTime, sdata$Sub_metering_1,type="l",col="black",xlab="", ylab="Energy sub metering")
lines(sdata$DateTime, sdata$Sub_metering_2,type="l",col="red")
lines(sdata$DateTime, sdata$Sub_metering_3,type="l",col="blue")
legend('topright', c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3') , lty=1, col=c('black', 'red', 'blue'), bty='n', cex=.8)
plot(sdata$DateTime, sdata$Global_reactive_power, type="l",xlab="datetime", ylab="Global_reactive_power")
dev.off()