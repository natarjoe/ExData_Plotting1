setwd("~/R/Project 1")

initdata <- read.csv("./household_power_consumption.txt",sep=";",stringsAsFactors=FALSE,na.strings=c("?"))
cleanAlldata <-na.omit(initdata)

cleanAlldata$Date <- as.Date(cleanAlldata$Date,format = "%d/%m/%Y")

cleandata <- subset(cleanAlldata,cleanAlldata$Date == "2007-02-01"| cleanAlldata$Date == "2007-02-02")


# Plot 1

png("plot1.png", width=480, height=480)

hist(cleandata$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

dev.off()







