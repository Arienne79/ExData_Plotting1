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

#Creating plot4
par(mfrow=c(2,2))
plot(mypower$timestamp,mypower$Global_active_power, type="l", xlab="", ylab="Global Active Power")
plot(mypower$timestamp,mypower$Voltage, type="l", xlab="datetime", ylab="Voltage")
plot(mypower$timestamp,mypower$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(mypower$timestamp,mypower$Sub_metering_2,col="red")
lines(mypower$timestamp,mypower$Sub_metering_3,col="blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), bty="n", cex=.5)
plot(mypower$timestamp,mypower$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()