## Plot 1

## Read and Clean Dataset:
## Instructions said to include the code for reading the data, so
## this chunk of code appears in each .R file for each plot:
## Read in dataset, specifying semicolon separator:
power <- read.table("household_power_consumption.txt", header=TRUE, sep=";")
dim(power); head(power) # Confirming dataset looks like it should
## Convert date and time to standardized format using lubridate:
library(lubridate)
power$timedate <-  paste(power$Date,",",power$Time)
power$timedate <- dmy_hms(power$timedate)
## subset dataset to only obs from Feb 1&2:
febpow <- subset(power,month(timedate)==2&year(timedate)==2007)
febpow <- subset(febpow,day(timedate)==1 | day(timedate)==2)
table(febpow$timedate); dim(febpow) # confirming subsetted data looks like it should
## make sure Global_active_power is formatted as numeric:
class(febpow$Global_active_power)
febpow$Global_active_power <- as.numeric(as.character(febpow$Global_active_power))
## confirm that variable Global_active_power looks like it should:
summary(febpow$Global_active_power); mean(febpow$Global_active_power,na.rm=TRUE)


## Making Plot 1:

## Generate the histogram, specifying red bars, x-axis range, and titles
## Confirm it looks good on the screen first:
hist(febpow$Global_active_power,col="red",xlim=c(0,6),
    main="Global Active Power",xlab="Global Active Power (kilowatts)")
## Copy to png file, specifying size:
dev.copy(png,file="plot1.png",width=480,height=480)
dev.off()



