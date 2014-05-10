fn <- "household_power_consumption.txt"
data <- read.table(fn,header=TRUE,sep=";",as.is=TRUE, na.strings="?")
filtered <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]
dateTime <- paste(filtered$Date, filtered$Time)
dateTime <- strptime(dateTime,"%d/%m/%Y %H:%M:%S")
filtered <- cbind(dateTime, filtered[,-c(1:2)])
rm(data)

png(filename="plot4.png",  width = 480, height = 480)
par(mfrow=c(2,2))
with(filtered, {
     #Graph 4.1
     plot(dateTime, 
          as.numeric(Global_active_power), 
          type="l", 
          ylab="Global Active Power (kilowatts)", 
          xlab="")
     
     #Graph 4.2
     plot(dateTime,
          as.numeric(Voltage),
          type="l",
          ylab="Voltage",
          xlab="datetime")
     
     #Graph 4.3, Line 1
     plot(dateTime, as.numeric(Sub_metering_1), 
          type="l",
          col="black",
          ylab="Energy sub metering", 
          xlab="")
     
     #Graph 4.3, Line 2
     lines(dateTime, as.numeric(Sub_metering_2),
           type="l",
           col="red")
     
     #Graph 4.3, Line 3
     lines(dateTime, as.numeric(Sub_metering_3),
           type="l",
           col="blue")
     
     #Graph 4.3, Legend
     legend("topright", 
            legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
            col=c("black", "red", "blue"), 
            lty=1)
     
     #Graph 4.4
     plot(dateTime, 
          as.numeric(Global_reactive_power), 
          type="l", 
          ylab="Global Active Power (kilowatts)", 
          xlab="datetime")
})
dev.off()