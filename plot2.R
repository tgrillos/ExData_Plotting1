## Plot 2

## Read and Clean Dataset:
## Instructions said to include the code for reading the data, so
## this chunk of code appears in each .R file for each plot:
## Read in dataset, specifying semicolon separator:
power <- read.table("household_power_consumption.txt", header=TRUE, sep=";")
## Convert date and time to standardized format using lubridate:
library(lubridate)
power$timedate <-  paste(power$Date,",",power$Time)
power$timedate <- dmy_hms(power$timedate)
head(power$timedate)
## subset dataset to only obs from Feb 1&2:
febpow <- subset(power,month(timedate)==2&year(timedate)==2007)
febpow <- subset(febpow,day(timedate)==1 | day(timedate)==2)
## make sure Global_active_power is formatted as numeric:
class(febpow$Global_active_power)
febpow$Global_active_power <- as.numeric(as.character(febpow$Global_active_power))


## Making Plot 2:
## create a plot, specifying axis labels and type as line graph:
with(febpow,plot(timedate,Global_active_power,ylab="Global Active Power",xlab="",type="l"))

## Copy to png file, specifying size:
dev.copy(png,file="plot2.png",width=480,height=480)
dev.off()
