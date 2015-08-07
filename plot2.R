## Read the input data
Sys.setlocale("LC_TIME", "English")
setwd("C:/QMetrics/Opleiding/Data Science/Courses/Exploratory Data Analysis/Course Projects/Course Project 1")
powerConsumption<-read.table("./household_power_consumption.txt",
                             sep=";",header=TRUE)
powerConsumption$Date<-strptime(paste(powerConsumption$Date,powerConsumption$Time),format="%d/%m/%Y %H:%M:%S")
powerConsumption$Date2<-as.Date(powerConsumption$Date)
## Only for the data from 2007-02-01 and 2007-02-02
powerConsumption<-powerConsumption[(powerConsumption$Date2>="2007-02-01"&powerConsumption$Date2<="2007-02-02"),]

powerConsumption$Global_active_power<-as.numeric(as.character(powerConsumption$Global_active_power))
png(file="plot2.png")
plot(powerConsumption$Date,powerConsumption$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",
     xlab="")
dev.off()
