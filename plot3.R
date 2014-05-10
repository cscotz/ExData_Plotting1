fn <- "household_power_consumption.txt"
data <- read.table(fn,header=TRUE,sep=";",as.is=TRUE, na.strings="?")
filtered <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]
dateTime <- paste(filtered$Date, filtered$Time)
dateTime <- strptime(dateTime,"%d/%m/%Y %H:%M:%S")
filtered <- cbind(dateTime, filtered[,-c(1:2)])
rm(data)

png(filename="plot3.png",  width = 480, height = 480)
with(filtered, {
     #Graph 3, Line 1
     plot(dateTime, as.numeric(Sub_metering_1), 
          type="l",
          col="black",
          ylab="Energy sub metering", 
          xlab="")
     
     #Graph 3, Line 2
     lines(dateTime, as.numeric(Sub_metering_2),
           type="l",
           col="red")
     
     #Graph 3, Line 3
     lines(dateTime, as.numeric(Sub_metering_3),
           type="l",
           col="blue")
     
     #Graph 3 Legend
     legend("topright", 
            legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
            col=c("black", "red", "blue"),
            lty=1)
})
dev.off()