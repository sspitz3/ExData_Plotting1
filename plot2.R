data<-read.table("household_power_consumption.txt",sep=";",header = TRUE,na.strings = "?")

subdata<-subset(data,Date=="2/2/2007"|Date=="1/2/2007")
subdata$Date<-as.Date(subdata$Date,"%d/%m/%Y")
test<-paste(subdata$Date,subdata$Time)
png(filename="plot2.png")
plot(as.POSIXct(strptime(test, "%Y-%m-%d %H:%M:%S")),subdata$Global_active_power,type="n",xlab=NA,ylab="Global Active Power (kilowatts)")
lines(as.POSIXct(strptime(test, "%Y-%m-%d %H:%M:%S")),subdata$Global_active_power)
dev.off()