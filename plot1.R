data<-read.table("household_power_consumption.txt",sep=";",header = TRUE,na.strings = "?")

subdata<-subset(data,Date=="2/2/2007"|Date=="1/2/2007")
png(filename="plot1.png")
hist(subdata$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")
dev.off()