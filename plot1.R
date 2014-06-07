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

# Plot1.png
hist(data$Global_active_power,main="Global Active Power", xlab="Global active power (kilowatts)",col="red")

# Saving plot as png file
png(file = "plot1.png", units="px",height=480,width=480)
hist(data$Global_active_power,main="Global Active Power", xlab="Global active power (kilowatts)",col="red")
# dev.copy(png,"plot1.png",units="px",height=480,width=480)
dev.off()

