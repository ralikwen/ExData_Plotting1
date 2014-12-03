fileName="household_power_consumption.txt"
data5row <- read.table(fileName, header = TRUE, nrows = 5, sep=';', stringsAsFactors=FALSE) 
classes <- sapply(data5row, class)
data <- read.table(fileName, header = TRUE, colClasses = classes, sep=';', na.strings = "?")
sdata <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]
sdata$DateTime<-strptime(paste (sdata$Date, sdata$Time), format = "%d/%m/%Y %H:%M:%S" )

png(file = "plot2.png", width = 480, height = 480, units = "px", pointsize = 12, bg = "white")
plot(sdata$DateTime, sdata$Global_active_power, type="l",xlab="", ylab="Global ACtive Power (kilowatts)",main="Global ACtive Power (kilowatts)",font.lab = 2,lwd=1)
dev.off()