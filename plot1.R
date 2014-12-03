fileName="household_power_consumption.txt"
data5row <- read.table(fileName, header = TRUE, nrows = 5, sep=';', stringsAsFactors=FALSE) 
classes <- sapply(data5row, class)
data <- read.table(fileName, header = TRUE, colClasses = classes, sep=';', na.strings = "?")
sdata <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]
sdata$DateTime<-strptime(paste (sdata$Date, sdata$Time), format = "%d/%m/%Y %H:%M:%S" )

png(file = "plot1.png", width = 480, height = 480, units = "px", pointsize = 12, bg = "white")
hist(sdata$Global_active_power,col="red",xlab="Global ACtive Power (kilowatts)",ylab="Frequency",ylim=c(0,1200),main="Global Active Power",font.lab = 2,lwd=2)
dev.off()