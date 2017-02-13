#reading & transforming the data

power <- read.table(file, header=T, sep=";")
power$Date <- as.Date(power$Date, format="%d/%m/%Y")
mypower <- power[(power$Date=="2007-02-01") | (power$Date=="2007-02-02"),]
mypower$Global_active_power <- as.numeric(as.character(mypower$Global_active_power))
mypower$Global_reactive_power <- as.numeric(as.character(mypower$Global_reactive_power))
mypower$Voltage <- as.numeric(as.character(mypower$Voltage))
mypower <- transform(mypower, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
mypower$Sub_metering_1 <- as.numeric(as.character(mypower$Sub_metering_1))
mypower$Sub_metering_2 <- as.numeric(as.character(mypower$Sub_metering_2))
mypower$Sub_metering_3 <- as.numeric(as.character(mypower$Sub_metering_3))

#Creating plot3
plot(mypower$timestamp,mypower$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(mypower$timestamp,mypower$Sub_metering_2,col="red")
lines(mypower$timestamp,mypower$Sub_metering_3,col="blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), lwd=c(1,1))
dev.copy(png, file="plot3.png", width=480, height=480)
dev.off()