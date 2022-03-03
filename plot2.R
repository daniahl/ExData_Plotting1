library(tidyverse)

#Load and filter data
d <- read_delim("household_power_consumption.txt", delim=";", na="?") %>%
  mutate(Date=as.Date(Date,format="%d/%m/%Y")) %>%
  filter(Date=="2007-02-01"|Date=="2007-02-02")

#Create plot
png(file="plot2.png", width=480, height=480)
plot(as.POSIXct(paste(as.Date(d$Date), d$Time)), d$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()