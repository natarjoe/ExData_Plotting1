setwd("~/R/Project 1")

initdata <- read.csv("./household_power_consumption.txt",sep=";",stringsAsFactors=FALSE,na.strings=c("?"))
cleanAlldata <-na.omit(initdata)

cleanAlldata$Date <- as.Date(cleanAlldata$Date,format = "%d/%m/%Y")

cleandata <- subset(cleanAlldata,cleanAlldata$Date == "2007-02-01"| cleanAlldata$Date == "2007-02-02")

cleandata$datetime <-strptime(paste(cleandata$Date,cleandata$Time),"%Y-%m-%d %H:%M:%S") 


#plot 4

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 



plot(cleandata$datetime, cleandata$Global_active_power, type="l", xlab="", ylab="Global Active Power")



plot(cleandata$datetime, cleandata$Voltage, type="l", xlab="datetime", ylab="Voltage")



plot(cleandata$datetime, cleandata$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")

lines(cleandata$datetime, cleandata$Sub_metering_2, type="l", col="red")

lines(cleandata$datetime, cleandata$Sub_metering_3, type="l", col="blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty= 1, col=c("black", "red", "blue"),bty="n")



plot(cleandata$datetime, cleandata$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")



dev.off()









