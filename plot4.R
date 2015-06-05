#Read the data
power1 <- read.csv("household_power_consumption.txt", sep=";", nrows = 10)
classes <- sapply(power1, class)
power1 <- read.table("household_power_consumption.txt", sep=";", 
                     header = TRUE, na.strings = "?", colClasses = classes)

#For the following two statements you will need to have lubridate and dplyr packages installed
#In case you do not have these packages installed, run the following two statements (Internet connection rquired):
#install.packages("lubridate")
#install.packages("dplyr")

power1$Date <- dmy(power1$Date)
power2 <- filter(power1, year(Date) == 2007 & month(Date) == 2 & (day(Date)==1 | day(Date)==2))
power2 <- mutate(power2, datetime = ymd_hms(paste(Date, Time)))

#Draw the plots
par(mfcol=c(2,2)) #divide the plot area into 4 parts

with(power2, {
  #Part 1
  plot(datetime, Global_active_power, type = "l", 
       ylab = "Global Active Power (Kilowatts)", xlab = "")
  #Part 2
  plot(datetime, Sub_metering_1, type = "l", xlab="", ylab="Energy sub metering")
  lines(datetime, Sub_metering_2, type = "l", col = "red")
  lines(datetime, Sub_metering_3, type = "l", col = "blue")
  legend("topright", bty="n", col = c("black", "red", "blue"), 
         legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lwd=1, cex=0.7)
  #Part 3
  plot(datetime, Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
  #Part 4
  plot(datetime, Global_reactive_power, xlab = "datetime", type = "l")
})