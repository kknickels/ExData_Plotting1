
#code to read data, draW plot on screen then recreate in PNG file
#load as source file then enter command "createPlot1()"

createPlot1 <- function() {
  
    #read and prep data file
    
    library(data.table)
    
    mydata <- read.table("household_power_consumption.txt", sep=";",
        header=TRUE, na.strings=c("NA", "N/A","?"),stringsAsFactors=FALSE,nrows=-1L, 
        colClasses=c("character","character", "numeric","numeric" ,"numeric", "numeric","numeric" ,"numeric","numeric"))
    
    mytable <- data.table(mydata, key = "Date")
    mySubTable<- subset(mytable, Date == "1/2/2007")
    mySubTable <- rbind(mySubTable,subset(mytable, Date == "2/2/2007") )
    
    #create histogram on screen
    hist(mySubTable$Global_active_power, xlab = "Global Active Power (kilowatts)", 
         ylab = "Frequency", col = "red", main = "Global Active Power")
    
    #--------------------------end Plot1 - create PNG
    #open device
    png(file="plot1.png", width = 480, height = 480, units = "px")
    
    #create histogram
    hist(mySubTable$Global_active_power, xlab = "Global Active Power (kilowatts)", 
         ylab = "Frequency", col = "red", main = "Global Active Power")
    
    #close device
    dev.off()
    
    #-------end-----
}

