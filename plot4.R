#Read the data
power1 <- read.csv("household_power_consumption.txt", sep=";", nrows = 10)
classes <- sapply(power1, class)
power1 <- read.table("household_power_consumption.txt", sep=";", 
                     header = TRUE, na.strings = "?", colClasses = classes)
library(lubridate) #in case lubridate is not installed, execute: install.packages("lubridate")
power1$Date <- dmy(power1$Date)
power2 <- filter(power1, year(Date) == 2007 & month(Date) == 2 & (day(Date)==1 | day(Date)==2))

#Draw the plots
par(mfcol=c(2,2)) #divide the plot area into 4 parts

with(power2, {
  #Part 1
  plot(Global_active_power, type = "l", ylab = "Global Active Power (Kilowatts)", 
       xlab = "", xaxt="n")
  axis(1, at=c(0,1440,2880), labels = c("Thu", "Fri", "Sat"))
  #Part 2
  plot(Sub_metering_1, type = "l", xlab="", ylab="Energy sub metering", xaxt = "n")
  axis(1, at=c(0,1440,2880), labels = c("Thu", "Fri", "Sat"))
  lines(Sub_metering_2, type = "l", col = "red")
  lines(Sub_metering_3, type = "l", col = "blue")
  legend("topright", bty="n", col = c("black", "red", "blue"), 
         legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lwd=1, cex=0.7)
  #Part 3
  plot(Voltage, type = "l", xaxt = "n", xlab = "datetime", ylab = "Voltage")
  axis(1, at=c(0,1440,2880), labels = c("Thu", "Fri", "Sat"))
  #Part 4
  plot(Global_reactive_power, xlab = "datetime", xaxt = "n", type = "l")
  axis(1, at=c(0,1440,2880), labels = c("Thu", "Fri", "Sat"))
})