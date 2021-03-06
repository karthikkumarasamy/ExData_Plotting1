
data<-read.table("household_power_consumption.txt", header= TRUE, sep=";", 
					colClasses=c("character","character",rep("numeric",7)),na="?")
head(data)

data[,1]<-as.Date(data$Date,"%d/%m/%Y")

subdata<-subset(data,data$Date %in% as.Date(c("2007-02-01","2007-02-02")))

subdata$DateTime<-as.POSIXct(paste(subdata$Date,subdata$Time),format="%Y-%m-%d %H:%M:%S")

head(subdata)

png(filename="plot2.png",
	width=480,height=480,
	units="px",bg="transparent")

plot(subdata[,10],subdata[,3],type="l",xlab="",ylab="Global Active Power(Kilowatts)")

dev.off()