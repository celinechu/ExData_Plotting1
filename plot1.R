## plot1.R is to contructs plot1.png
## code should read the data first
## code should create the PNG file
## dates 2007-02-01 and 2007-02-02

#read data into R
powerdata <- read.table("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors = FALSE)
#subset data with the specified dates
subset_powerdata <- powerdata[powerdata$Date %in% c("1/2/2007","2/2/2007"),]

globalActivePower <- as.numeric(subset_powerdata$Global_active_power)
hist(globalActivePower,col="red",ylim=c(0,1200),main="Global Active Power",xlab="Global Actie Power (kilowatts)")
dev.copy(png,file="plot1.png",width=480,height=480)
dev.off()