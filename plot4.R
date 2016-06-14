# setting plotting parameters
par(mfcol=c(2,2))

library(data.table)
data<-fread("household_power_consumption.txt",na.strings = c("?"))

#converting date column into date type using lubridate package
library(lubridate)
data$Date<-dmy(data$Date)

#subsetting data for 2007-02-01 and 2007-02-02
new_data<-subset(data,Date==as.Date("2007-02-01")|Date==as.Date("2007-02-02"))

View(new_data)

#removing original dataset from the R memory
rm("data")

#plotting 1st column

plot(seq(1:length(new_data$Global_active_power)),new_data$Global_active_power,axes = FALSE,type="l",ylab="Global Active Power (Kilowatts)",xlab ="" )
axis(2)
xticks<-c("Thu","Fri","Sat")
axis(1,at=c(1,1440,2880),labels = xticks)

plot(seq(1:length(new_data$Sub_metering_1)),new_data$Sub_metering_1,axes = FALSE,type="l",col="black",ylab = "Energy Submetering",xlab = "")
axis(2)
xticks<-c("Thu","Fri","Sat")
axis(1,at=c(1,1440,2880),labels = xticks)
lines(seq(1:length(new_data$Sub_metering_2)),new_data$Sub_metering_2,col="red")
lines(seq(1:length(new_data$Sub_metering_3)),new_data$Sub_metering_3,col="blue")
legend("topright",col = c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))


#code for second column plot 1
xticks<-c("Thu","Fri","Sat")
plot(seq(1:length(new_data$Voltage)),new_data$Voltage,axes = FALSE,type="l",ylab = "Voltage",xlab = "datetime")
axis(2)
axis(1,at=c(1,1440,2880),labels=xticks)

# code for second column plot 2
plot(seq(1:length(new_data$Global_reactive_power)),new_data$Global_reactive_power,type = "l",axes = FALSE,ylab = "Global_reactive_power",xlab = "datetime")
axis(2)
axis(1,at=c(1,1440,2880),labels = xticks)

#saving file to plot4
dev.copy(png,"plot4.png")
dev.off()
