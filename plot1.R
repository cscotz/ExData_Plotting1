fn <- "household_power_consumption.txt"
data <- read.table(fn,header=TRUE,sep=";",as.is=TRUE, na.strings="?")
filtered <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]
dateTime <- paste(filtered$Date, filtered$Time)
dateTime <- strptime(dateTime,"%d/%m/%Y %H:%M:%S")
filtered <- cbind(dateTime, filtered[,-c(1:2)])
rm(data)

png(filename="plot1.png",  width = 480, height = 480)
with(filtered,
     hist(as.numeric(Global_active_power), 
          xlab="Global Active Power (kilowatts)", 
          main="Global Active Power", 
          col="red")
)
dev.off()