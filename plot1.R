fn <- "household_power_consumption.txt"
data <- read.table(fn,header=TRUE,sep=";")
filtered <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]
dateTime <- paste(filtered$Date, filtered$Time)
dateTime <- strptime(dateTime,"%d/%m/%Y %H:%M:%S")
filtered <- cbind(dateTime, filtered[,-c(1:2)])

png(filename="plot1.png",  width = 480, height = 480)
hist(as.numeric(as.character(filtered$Global_active_power)), xlab="Global Active Power (kilowatts)", main="Global Active Power", col="red")
dev.off()