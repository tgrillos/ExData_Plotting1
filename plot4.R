## Plot 4

## Read and Clean Dataset:
## Instructions said to include the code for reading the data, so
## this chunk of code appears in each .R file for each plot with minor additions:
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
## make sure relevant variables are formatted as numeric:
## Global Active Power:
febpow$Global_active_power <- as.numeric(as.character(febpow$Global_active_power)) #convert to numeric
## Submetering vars:
febpow$Sub_metering_1 <- as.numeric(as.character(febpow$Sub_metering_1)) #convert SM1 to numeric
febpow$Sub_metering_2 <- as.numeric(as.character(febpow$Sub_metering_2)) #convert SM1 to numeric
## Voltage:
class(febpow$Voltage);table(febpow$Voltage)
febpow$Voltage <- as.numeric(as.character(febpow$Voltage)) #convert SM1 to numeric
## Global reactive power:
class(febpow$Global_reactive_power)
febpow$Global_reactive_power <- as.numeric(as.character(febpow$Global_reactive_power)) #convert SM1 to numeric

## Making Plot 4:

## Set graphical parameters to make space for four graphs, to be filled column-wise:
par(mfcol=c(2,2),mar=c(4,4,4,4))

## Repeat code from plot 2 for upper left graph:
with(febpow,plot(timedate,Global_active_power,ylab="Global Active Power",xlab="",type="l"))

## Repeat code from plot 3 for lower left graph:
plot(febpow$timedate,febpow$Sub_metering_1,ylab="Energy sub metering",xlab="",type="n")
with(febpow,points(timedate,Sub_metering_1,type="l",col="black"))
with(febpow,points(timedate,Sub_metering_2,type="l",col="red"))
with(febpow,points(timedate,Sub_metering_3,type="l",col="blue"))
legend("topright",lty=1,col=c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex=0.6)

## Make new plot of voltage for upper right:
with(febpow,plot(timedate,Voltage,type="l",ylab="Voltage",xlab="datetime"))

## Make new plot of Global_reactive_power for lower right:
with(febpow,plot(timedate,Global_reactive_power,type="l",xlab="datetime"))

## Copy to png file, specifying size:
dev.copy(png,file="plot4.png",width=480,height=480)
dev.off()
