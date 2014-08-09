## PLot3

data<-read.table("household_power_consumption.txt", header= TRUE, sep=";", 
					colClasses=c("character","character",rep("numeric",7)),na="?")
head(data)

data[,1]<-as.Date(data$Date,"%d/%m/%Y")

subdata<-subset(data,data$Date %in% as.Date(c("2007-02-01","2007-02-02")))

subdata$DateTime<-as.POSIXct(paste(subdata$Date,subdata$Time),format="%Y-%m-%d %H:%M:%S")

head(subdata)

png(filename="plot3.png",
	width=480,height=480,
	units="px",bg="transparent")

plot(subdata[,10],subdata[,7],type="l",col="black",xlab="",ylab="Energy sub metering")
lines(subdata[,10],subdata[,8],type="l",col="red")
lines(subdata[,10],subdata[,9],type="l",col="blue")
legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2",
"Sub_metering_3"),lwd=1)

dev.off()