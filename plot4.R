# Download and unzip file
url<-"http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"  # download zipped file on windows
download.file(url,"hhpower.zip")            # naming the file hhpower.zip 
unzip("hhpower.zip")

# Reading data of 0/01/2007 and 02/01/2007
data <- read.table("household_power_consumption.txt", sep=";", skip=66637,nrow=2880)
firstline <- readLines("household_power_consumption.txt",n=1)   # temp holder for names
names(data)<-strsplit(firstline,";") [[1]]

# Convert date column into date format
data<-data.frame(Date_Time=0,data)        # adding a column
data$Date_Time<-paste(data$Date,data$Time,sep=" ")  # merging date and time columns
data$Date<-as.Date(data$Date,tz="NZ", format="%d/%m/%Y")
data$Date_Time<-strptime(data$Date_Time,format="%d/%m/%Y %H:%M:%S",tz="NZ")

# Plot4.png
par(mfrow=c(2,2),mar=c(4,4,3,2))
with(data,
{plot(Date_Time,Global_active_power,type="l",lwd=1,
      xlab="",ylab="Global active power (kilowatts)")
 plot(Date_Time,Voltage,type="l",lwd=1,
      xlab="datetime",ylab="Voltage")
 plot(Date_Time,Sub_metering_1,type="l",lwd=1,
      xlab="",ylab="Energy sub metering")
 lines(Date_Time,Sub_metering_2,col="red")
 lines(Date_Time,Sub_metering_3,col="blue")
 legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
        col=c("black","red","blue"),lty=1,cex=0.7)
 plot(Date_Time,Global_reactive_power,type="l",lwd=1,xlab="datetime")})
par(mfrow=c(1,1),mar=c(5.1,4.1,4.1,2.1))

# Saving plot as png file
png(file = "plot4.png", units="px",height=480,width=480)
par(mfrow=c(2,2),mar=c(4,4,3,2))
with(data,
{plot(Date_Time,Global_active_power,type="l",lwd=1,
      xlab="",ylab="Global active power (kilowatts)")
 plot(Date_Time,Voltage,type="l",lwd=1,
      xlab="datetime",ylab="Voltage")
 plot(Date_Time,Sub_metering_1,type="l",lwd=1,
      xlab="",ylab="Energy sub metering")
 lines(Date_Time,Sub_metering_2,col="red")
 lines(Date_Time,Sub_metering_3,col="blue")
 legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
        col=c("black","red","blue"),lty=1,cex=0.7)
 plot(Date_Time,Global_reactive_power,type="l",lwd=1,xlab="datetime")})
par(mfrow=c(1,1),mar=c(5.1,4.1,4.1,2.1))
dev.off()

