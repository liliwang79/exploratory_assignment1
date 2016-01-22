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


#plot1.R
names(extract)

hist(extract$Global_active_power, col="red", main="Global Active Power" , xlab="Golbal Active Power (kilowatts)" )
dev.copy(png, file="plot1.png",width=480, height=480)
dev.off()
