setwd("~/R/Project 1")

initdata <- read.csv("./household_power_consumption.txt",sep=";",stringsAsFactors=FALSE,na.strings=c("?"))
cleanAlldata <-na.omit(initdata)

cleanAlldata$Date <- as.Date(cleanAlldata$Date,format = "%d/%m/%Y")

cleandata <- subset(cleanAlldata,cleanAlldata$Date == "2007-02-01"| cleanAlldata$Date == "2007-02-02")

cleandata$datetime <-strptime(paste(cleandata$Date,cleandata$Time),"%Y-%m-%d %H:%M:%S") 

#Plot 2

png("plot2.png", width=480, height=480)

plot(cleandata$datetime, cleandata$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()











