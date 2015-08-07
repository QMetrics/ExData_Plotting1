## Read the input data
setwd("C:/QMetrics/Opleiding/Data Science/Courses/Exploratory Data Analysis/Course Projects/Course Project 1")
powerConsumption<-read.table("C:/QMetrics/Opleiding/Data Science/Courses/Exploratory Data Analysis/Course Projects/Course Project 1/household_power_consumption.txt",
                                      sep=";",header=TRUE)
powerConsumption$Date<-paste(powerConsumption$Date,powerConsumption$Time)
powerConsumption$Date<-as.Date(strptime(powerConsumption$Date,format="%d/%m/%Y %H:%M:%S"))
## Only for the data from 2007-02-01 and 2007-02-02
powerConsumption<-powerConsumption[(powerConsumption$Date>="2007-02-01"&powerConsumption$Date<="2007-02-02"),]
powerConsumption$Global_active_power<-as.numeric(as.character(powerConsumption$Global_active_power))
png(file="plot1.png")
hist(powerConsumption$Global_active_power, breaks=12,col="red",main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")
dev.off()
