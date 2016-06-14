# loading dataset into R
setwd("F:\\data_science\\ExData_Plotting1")
list.files()

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

#setting plotting parameters
par(mfrow=c(1,1))

## plotting plot2
plot(seq(1:length(new_data$Global_active_power)),new_data$Global_active_power,axes = FALSE,type="l",ylab="Global Active Power (Kilowatts)",xlab ="" )
axis(2)
xticks<-c("Thu","Fri","Sat")
axis(1,at=c(1,1440,2880),labels = xticks)

# exporting the plot to a png file named plo1.png
dev.copy(png,"plot2.png")
dev.off()