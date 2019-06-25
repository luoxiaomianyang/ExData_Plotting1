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
head(new_data)
dev.new()
png(file = "plot2.png")
plot(as.POSIXct(paste(new_data$Date, new_data$Time), format="%d/%m/%Y %H:%M:%S"),
     as.numeric(new_data$Global_active_power), type = "l",
     xlab = " ", ylab = "Global Active Power (kilowatts)")
dev.off()
