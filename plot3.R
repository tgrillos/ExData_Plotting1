## Plot 3

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
class(febpow$Global_active_power) #checking for class
febpow$Global_active_power <- as.numeric(as.character(febpow$Global_active_power)) #convert to numeric
## Submetering vars:
class(febpow$Sub_metering_1); class(febpow$Sub_metering_2); class(febpow$Sub_metering_3) #sub_metering_3 is already numeric
table(febpow$Sub_metering_1); table(febpow$Sub_metering_2) #check others have no wacky values
febpow$Sub_metering_1 <- as.numeric(as.character(febpow$Sub_metering_1)) #convert SM1 to numeric
febpow$Sub_metering_2 <- as.numeric(as.character(febpow$Sub_metering_2)) #convert SM1 to numeric


## Making Plot 3:
plot(febpow$timedate,febpow$Sub_metering_1,ylab="Energy sub metering",xlab="",type="n")
with(febpow,points(timedate,Sub_metering_1,type="l",col="black"))
with(febpow,points(timedate,Sub_metering_2,type="l",col="red"))
with(febpow,points(timedate,Sub_metering_3,type="l",col="blue"))
legend("topright",lty=1,col=c("black","red","blue"), cex=0.75,
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))


## Copy to png file, specifying size:
dev.copy(png,file="plot3.png",width=480,height=480)
dev.off()
