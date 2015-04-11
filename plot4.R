
#read and prep data file

library(data.table)

mydata <- read.table("household_power_consumption.txt", sep=";",header=TRUE, na.strings=c("NA", "N/A","?"),stringsAsFactors=FALSE,nrows=-1L, colClasses=c("character","character", "numeric","numeric" ,"numeric", "numeric","numeric" ,"numeric","numeric"))

mytable <- data.table(mydata, key = "Date")
> mySubTable<- subset(mytable, Date == "1/2/2007")
> mySubTable <- rbind(mySubTable,subset(mytable, Date == "2/2/2007") )

mySubTable$TS<- as.POSIXct(paste(mySubTable$Date,mySubTable$Time), format="%d/%m/%Y %H:%M:%S")


#-------------start plot 4 ------

par(mfrow = c(2,2), mar = c(4,4,2,1), oma= c(0,0,1,0))


#draw chart in upper left
plot(x=mySubTable$TS, y=mySubTable$Global_active_power, type = "l", xlab = " ", ylab = "Global Active Power (kilowatts)")

#draw chart in upper right
plot(x=mySubTable$TS, y=mySubTable$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

#bottom left
plot(x=mySubTable$TS, y=mySubTable$Sub_metering_1, type = "l", col = "black", xlab = " ", ylab = "Energy sub metering")
points(x=mySubTable$TS, y=mySubTable$Sub_metering_2, col = "red", type ="l")
points(x=mySubTable$TS, y=mySubTable$Sub_metering_3, col = "blue", type ="l")

legend("topright", pch = "-", col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), bty = "n")

#Bottom right
plot(x=mySubTable$TS, y=mySubTable$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")


#--------------End of plot 4 ----------

png(file="plot4.png", width = 480, height = 480, units = "px")

