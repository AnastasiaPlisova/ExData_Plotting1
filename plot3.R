plot2 <- function(dir)  ## dir is the directory
{
  
  data <- read.table(dir, sep=";", quote="\"")
  names(data) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
  data <- data[2:2075260, ]
  data$DateTime <- dmy_hms(paste(data$Date, data$Time))
  data$Date <- dmy(data$Date)
  u <- (data$Date=="2007-02-01")|(data$Date=="2007-02-02")
  data1 <- data[u,]
  data1$Global_active_power <- as.numeric(as.character(data1$Global_active_power))
  data1$Sub_metering_1 <- as.numeric(as.character(data1$Sub_metering_1))
  data1$Sub_metering_2 <- as.numeric(as.character(data1$Sub_metering_2))
  data1$Sub_metering_3 <- as.numeric(as.character(data1$Sub_metering_3))
  png(file = "plot3.png",width = 480, height = 480, bg = "transparent")
  plot(data1$DateTime, data1$Sub_metering_1, type = "l", col= "black", xlab="", ylab= "Energy sub metering")
  lines(data1$DateTime, data1$Sub_metering_2, col = "red")
  lines(data1$DateTime, data1$Sub_metering_3, col = "blue")
  legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty =1, col= c("black", "red", "blue"))
  
  dev.off()
  
}