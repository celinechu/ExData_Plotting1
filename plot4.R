## plot4.R is to contructs plot4.png
## code should read the data first
## code should create the PNG file
## dates 2007-02-01 and 2007-02-02

#read data into R
powerdata <- read.table("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors = FALSE)
#subset data with the specified dates
subset_powerdata <- powerdata[powerdata$Date %in% c("1/2/2007","2/2/2007"),]

globalActivePower <- as.numeric(subset_powerdata$Global_active_power)
globalReactivePower <- as.numeric(subset_powerdata$Global_reactive_power)
voltage <- as.numeric(subset_powerdata$Voltage)
temp <- paste(subset_powerdata$Date,subset_powerdata$Time)
datetime <- strptime(temp,"%d/%m/%Y %H:%M:%S")
meter1<-as.numeric(subset_powerdata$Sub_metering_1)
meter2<-as.numeric(subset_powerdata$Sub_metering_2)
meter3<-as.numeric(subset_powerdata$Sub_metering_3)

png("plot4.png",width=480,height=480)
par(mfrow = c(2,2))

plot(datetime,globalActivePower,type="l",xlab="",ylab="Global Active Power",cex=0.3)

plot(datetime,voltage,type="l",xlab="datetime",ylab="Voltage")

plot(datetime,meter1,type="l",ylab="Energy Submetering",xlab="")
lines(datetime,meter2,type="l",col="red")
lines(datetime,meter3,type="l",col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty=,lwd=2, col=c("black", "red", "blue"),bty="n")

plot(datetime,globalReactivePower,type="l",xlab="datetime",ylab="Global_reative_power")

dev.off()