## Read the input data
Sys.setlocale("LC_TIME", "English")
setwd("C:/QMetrics/Opleiding/Data Science/Courses/Exploratory Data Analysis/Course Projects/Course Project 1")
powerConsumption<-read.table("./household_power_consumption.txt",
                             sep=";",header=TRUE)
powerConsumption$Date<-strptime(paste(powerConsumption$Date,powerConsumption$Time),format="%d/%m/%Y %H:%M:%S")
powerConsumption$Date2<-as.Date(powerConsumption$Date)
## Only for the data from 2007-02-01 and 2007-02-02
powerConsumption<-powerConsumption[(powerConsumption$Date2>="2007-02-01"&powerConsumption$Date2<="2007-02-02"),]
powerConsumption$Sub_metering_1<-as.numeric(as.character(powerConsumption$Sub_metering_1))
powerConsumption$Sub_metering_2<-as.numeric(as.character(powerConsumption$Sub_metering_2))
powerConsumption$Sub_metering_3<-as.numeric(as.character(powerConsumption$Sub_metering_3))
png(file="plot3.png")
plot(powerConsumption$Date,powerConsumption$Sub_metering_1,type="l",ylab="Energy sub metering",
     xlab="", col="black")
lines(powerConsumption$Date,powerConsumption$Sub_metering_2, col="red")
lines(powerConsumption$Date,powerConsumption$Sub_metering_3, col="blue")
dev.off()