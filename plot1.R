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


#removing original dataset from the R memory
rm("data")

## setting plotting parameters
par(mfrow=c(1,1))
    
## Drawing the first plot using the R base plotting system
hist(new_data$Global_active_power,xlab = "Global Active Power (kiowatts)",ylab = "Frequency",col = "red")

# exporting the plot to a png file named plo1.png
dev.copy(png,"plot1.png")
dev.off()
