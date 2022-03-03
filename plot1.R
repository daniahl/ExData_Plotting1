library(tidyverse)

#Load and filter data
d <- read_delim("household_power_consumption.txt", delim=";", na="?") %>%
     mutate(Date=as.Date(Date,format="%d/%m/%Y")) %>%
     filter(Date=="2007-02-01"|Date=="2007-02-02")

#Create plot
png(file="plot1.png", width=480, height=480)
hist(d$Global_active_power, col="red", ylim=c(0,1200), xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()