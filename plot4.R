plot4 <- function(file = "household_power_consumption.txt"){
        
        
        dt <- read.table(file, header = TRUE, sep = ";", dec = ".", 
                         na.strings = "?", 
                         strip.white = FALSE,
                         allowEscapes = FALSE, flush = FALSE)
        
        #2007-02-01 and 2007-02-02        
        dt$DateTime  <- paste(dt$Date, dt$Time, sep=" ")
        dt$DateTime  <- as.POSIXct(strptime(dt$DateTime, format = "%d/%m/%Y %H:%M:%S"))
        
        dt.sub  <- subset(dt, DateTime >= as.POSIXct("2007-02-01") &  DateTime < as.POSIXct("2007-02-3"))
        
        png(filename="plot4.png", width = 480, height = 480, units = "px") 
        par(mfrow=c(2,2))
        with(dt.sub, {
                plot(DateTime, as.numeric(Global_active_power), xlab="", ylab="Global Active Power", type="l")
                plot(DateTime, Voltage, xlab="datetime", ylab="Voltage", type="l")
                plot(DateTime, Sub_metering_1, xlab="", ylab="Energy sub metering", type="l")
                lines(DateTime, Sub_metering_2, col="red", type="l")
                lines(DateTime, Sub_metering_3, type="l", col="blue")
                legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1,col=c("black","red","blue"))
                plot(DateTime, Global_reactive_power, xlab="datetime", ylab="Global_reactive_power", type="l")
        })      
        
        dev.off()
        
}