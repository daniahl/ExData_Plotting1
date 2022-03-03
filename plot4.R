library(tidyverse)

#Load and filter data
d <- read_delim("household_power_consumption.txt", delim=";", na="?") %>%
  mutate(Date=as.Date(Date,format="%d/%m/%Y")) %>%
  filter(Date=="2007-02-01"|Date=="2007-02-02")
dates <- as.POSIXct(paste(as.Date(d$Date), d$Time))   #to get days of the week in plot

#Create plot
png(file="plot4.png", width=480, height=480)
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(d, {
  plot(Global_active_power~dates, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  plot(Voltage~dates, type="l", 
       ylab="Voltage", xlab="")
  plot(Sub_metering_1~dates, type="l", 
       ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~dates,col='Red')
  lines(Sub_metering_3~dates,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~dates, type="l", 
       ylab="Global_reactive_power",xlab="datetime")
})
dev.off()