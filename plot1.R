power1 <- read.csv("household_power_consumption.txt", sep=";", nrows = 10)
classes <- sapply(power1, class)
power1 <- read.table("household_power_consumption.txt", sep=";", 
                          header = TRUE, na.strings = "?", colClasses = classes)
						  
#For the following two statements you will need to have lubridate and dplyr packages installed
#In case you do not have these packages installed, run the following two statements (Internet connection rquired):
#install.packages("lubridate")
#install.packages("dplyr")

library(lubridate)
library(dplyr)

power1$Date <- dmy(power1$Date)
power2 <- filter(power1, year(Date) == 2007 & month(Date) == 2 & (day(Date)==1 | day(Date)==2))
hist(power2$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (Kilowatts)")
