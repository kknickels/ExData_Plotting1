
#read and prep data file

library(data.table)

mydata <- read.table("household_power_consumption.txt", sep=";",header=TRUE, na.strings=c("NA", "N/A","?"),stringsAsFactors=FALSE,nrows=-1L, colClasses=c("character","character", "numeric","numeric" ,"numeric", "numeric","numeric" ,"numeric","numeric"))

mytable <- data.table(mydata, key = "Date")
mySubTable<- subset(mytable, Date == "1/2/2007")
mySubTable <- rbind(mySubTable,subset(mytable, Date == "2/2/2007") )

#create Date Time stamp field for graphing
mySubTable$TS<- as.POSIXct(paste(mySubTable$Date,mySubTable$Time), format="%d/%m/%Y %H:%M:%S")

#------start of plot2-----------

plot(x=mySubTable$TS, y=mySubTable$Global_active_power, type = "l", xlab = " ", ylab = "Global Active Power (kilowatts)")


#=------end Plot 2 start PNG and outline

png(file="plot2.png", width = 480, height = 480, units = "px")

plot(x=mySubTable$TS, y=mySubTable$Global_active_power, type = "l", xlab = " ", ylab = "Global Active Power (kilowatts)")

dev.off()
