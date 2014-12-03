fileName="household_power_consumption.txt"
data5row <- read.table(fileName, header = TRUE, nrows = 5, sep=';', stringsAsFactors=FALSE) 
classes <- sapply(data5row, class)
data <- read.table(fileName, header = TRUE, colClasses = classes, sep=';', na.strings = "?")
sdata <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]
sdata$DateTime<-strptime(paste (sdata$Date, sdata$Time), format = "%d/%m/%Y %H:%M:%S" )

png(file = "plot3.png", width = 480, height = 480, units = "px", pointsize = 12, bg = "white")
plot(sdata$DateTime, sdata$Sub_metering_1,type="l",col="black",xlab="", ylab="Energy sub metering",font.lab = 2,lwd=1)
lines(sdata$DateTime, sdata$Sub_metering_2,type="l",col="red")
lines(sdata$DateTime, sdata$Sub_metering_3,type="l",col="blue")
legend('topright', c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3') , lty=1, col=c('black', 'red', 'blue'), cex=.9)
dev.off()