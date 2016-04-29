data<-read.table("household_power_consumption.txt",sep=";",header = TRUE,na.strings = "?")

subdata<-subset(data,Date=="2/2/2007"|Date=="1/2/2007")
subdata$Date<-as.Date(subdata$Date,"%d/%m/%Y")
test<-paste(subdata$Date,subdata$Time)
png(filename="plot4.png")

par(mfrow=c(2,2))

plot(as.POSIXct(strptime(test, "%Y-%m-%d %H:%M:%S")),subdata$Global_active_power,type="n",xlab=NA,ylab="Global Active Power (kilowatts)")
lines(as.POSIXct(strptime(test, "%Y-%m-%d %H:%M:%S")),subdata$Global_active_power)

plot(as.POSIXct(strptime(test, "%Y-%m-%d %H:%M:%S")),subdata$Voltage,type="n",xlab="datetime",ylab="Voltage")
lines(as.POSIXct(strptime(test, "%Y-%m-%d %H:%M:%S")),subdata$Voltage)

plot(as.POSIXct(strptime(test, "%Y-%m-%d %H:%M:%S")),subdata$Global_active_power,type="n",xlab=NA,ylab="Energy sub metering",ylim=c(1,38))
lines(as.POSIXct(strptime(test, "%Y-%m-%d %H:%M:%S")),subdata$Sub_metering_1,col="black")
lines(as.POSIXct(strptime(test, "%Y-%m-%d %H:%M:%S")),subdata$Sub_metering_2,col="red")
lines(as.POSIXct(strptime(test, "%Y-%m-%d %H:%M:%S")),subdata$Sub_metering_3,col="blue")
legend("topright",lty=c(1,1),col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

plot(as.POSIXct(strptime(test, "%Y-%m-%d %H:%M:%S")),subdata$Global_reactive_power,type="n",xlab="datetime",ylab="Global_reactive_power")
lines(as.POSIXct(strptime(test, "%Y-%m-%d %H:%M:%S")),subdata$Global_reactive_power)


dev.off()