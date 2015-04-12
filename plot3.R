#code to read data, draW plot3 on screen then recreate in PNG file
#load as source file then enter command "createPlot3()"

createPlot3 <- function() {
  
    #read, subset and format data file
    
    library(data.table)
    
    mydata <- read.table("household_power_consumption.txt", sep=";",header=TRUE, na.strings=c("NA", "N/A","?"),
              stringsAsFactors=FALSE,nrows=-1L, colClasses=c("character","character", "numeric","numeric" ,"numeric", "numeric","numeric" ,"numeric","numeric"))
    
    mytable <- data.table(mydata, key = "Date")
    mySubTable<- subset(mytable, Date == "1/2/2007")
    mySubTable <- rbind(mySubTable,subset(mytable, Date == "2/2/2007") )
    
    mySubTable$TS<- as.POSIXct(paste(mySubTable$Date,mySubTable$Time), format="%d/%m/%Y %H:%M:%S")
    
    #-----------create Plot3 in screen---------
    
    #set spacing parameters
    par(mfrow = c(1,1), mar = c(4,4,2,1), oma= c(0,0,1,0))
    
    plot(x=mySubTable$TS, y=mySubTable$Sub_metering_1, type = "l", col = "black", xlab = " ", 
         ylab = "Energy sub metering")
    points(x=mySubTable$TS, y=mySubTable$Sub_metering_2, col = "red", type ="l")
    points(x=mySubTable$TS, y=mySubTable$Sub_metering_3, col = "blue", type ="l")
    
    legend("topright", pch = "-", col = c("black", "red", "blue"), 
           legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
    
    #-------------end plot 3 screen------Now create plot 3 in png
    
    png(file="plot3.png", width = 480, height = 480, units = "px")
    
    
    plot(x=mySubTable$TS, y=mySubTable$Sub_metering_1, type = "l", col = "black", xlab = " ", 
         ylab = "Energy sub metering")
    
    points(x=mySubTable$TS, y=mySubTable$Sub_metering_2, col = "red", type ="l")
    
    points(x=mySubTable$TS, y=mySubTable$Sub_metering_3, col = "blue", type ="l")
    
    legend("topright", pch = "-", col = c("black", "red", "blue"), 
           legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
    
    dev.off()
}
    #-----close device ---end of program
