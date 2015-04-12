plot1 <- function(dir)  ## dir is the directory
{
  
  data <- read.table(dir, sep=";", quote="\"")
  names(data) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
  data <- data[2:2075260, ]
  data$DateTime <- dmy_hms(paste(data$Date, data$Time))
  data$Date <- dmy(data$Date)
  u <- (data$Date=="2007-02-01")|(data$Date=="2007-02-02")
  data1 <- data[u,]
  data1$Global_active_power <- as.numeric(as.character(data1$Global_active_power))
  png(file = "plot1.png",width = 480, height = 480, bg = "transparent")
  hist(data1$Global_active_power, col = "red", main = paste("Global Active Power"), xlab = "Global Active Power (kilowatts)")
  dev.off()
  
}