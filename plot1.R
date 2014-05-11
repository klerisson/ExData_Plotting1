plot1 <- function(file = "household_power_consumption.txt"){
        
        
        dt <- read.table(file, header = TRUE, sep = ";", dec = ".", 
                         na.strings = "?", 
                         strip.white = FALSE,
                         allowEscapes = FALSE, flush = FALSE)
        
        #2007-02-01 and 2007-02-02        
        dt$DateTime  <- paste(dt$Date, dt$Time, sep=" ")
        dt$DateTime  <- as.POSIXct(strptime(dt$DateTime, format = "%d/%m/%Y %H:%M:%S"))
        
        dt.sub  <- subset(dt, DateTime >= as.POSIXct("2007-02-01") &  DateTime < as.POSIXct("2007-02-3"))
        
        png(filename="plot1.png", width = 480, height = 480, units = "px")
        hist(dt.sub$Global_active_power, col="red", main="Global Active Power",  
             xlab="Global Active Power (kilowatts)")
        dev.off()
        
}
