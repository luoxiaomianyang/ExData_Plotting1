# Clear all variables and prior sessions
rm(list = ls(all = TRUE))

# Set 'working directory'
wdir <- "/Users/Ruoshi/Documents/Study/Data Science/Coursera_Johns_Hopkins/Class 4/Class Practice"
setwd(wdir)

library(ggplot2)
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
head(data)
adjusted_data <- data[as.Date(data$Date, format = "%d/%m/%Y") >= '2007-02-01', ]
new_data <- adjusted_data[as.Date(adjusted_data$Date, "%d/%m/%Y") <= '2007-02-02', ]
dev.new()
png(file = "plot3.png")
plot(as.POSIXct(paste(new_data$Date, new_data$Time), format="%d/%m/%Y %H:%M:%S"),
     as.numeric(new_data$Sub_metering_1),
     type = "l",
     pch = 15,
     xlab = " ",
     ylab = "Energy sub metering")
lines(as.POSIXct(paste(new_data$Date, new_data$Time), format="%d/%m/%Y %H:%M:%S"),
      as.numeric(new_data$Sub_metering_2),
      pch = 15,
      col = "red")
lines(as.POSIXct(paste(new_data$Date, new_data$Time), format="%d/%m/%Y %H:%M:%S"),
      as.numeric(new_data$Sub_metering_3),
      pch = 15,
      col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = c(1, 1, 1), col = c("black", "red", "blue"))
dev.off()
