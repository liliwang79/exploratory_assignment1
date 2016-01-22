setwd("/Users/lwang/liliwang/coursera/R/exploratory")
exploratory<-read.table("household_power_consumption.txt", sep=";",head=TRUE)
exploratory$Date<-as.Date(exploratory$Date,format="%d/%m/%Y")
extract<-subset(exploratory,Date=="2007-02-01" | Date=="2007-02-02")
dim(extract)
rm(exploratory)
extract$Global_active_power<-as.numeric(extract$Global_active_power)
extract$Sub_metering_1<-as.numeric(extract$Sub_metering_1)
extract$Sub_metering_2<-as.numeric(extract$Sub_metering_2)
extract$Sub_metering_3<-as.numeric(extract$Sub_metering_3)
extract <- transform(extract, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")


#plot4.R
par(mfrow=c(2,2), mar=c(4,4,2,1))
#1
plot(extract$timestamp, extract$Global_active_power,type="l", xlab= " ", ylab="Global Active Power (Kilowatts)")
#2
plot(extract$timestamp,extract$Voltage,type="l", xlab="datetime", ylab="Voltage")
#3
plot(extract$timestamp, extract$Sub_metering_1, type="l", xlab=" ", ylab="Energy sub metering", col="black")
lines(extract$timestamp, extract$Sub_metering_2,  col="red")
lines(extract$timestamp, extract$Sub_metering_3,  col="blue")
legend("topright", col=c("black","red","blue"),c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       lty=c(1,1), lwd=c(1,1), bty="n", cex=.5)
#4
plot(extract$timestamp,extract$Global_reactive_power,type="l", xlab="datetime",ylab="Global_reactive_power")

dev.copy(png, file="plot4.png",width=480, height=480)
dev.off()


