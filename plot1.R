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

#Creating plot1
hist(mypower$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()