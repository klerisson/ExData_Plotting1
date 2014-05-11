plot2 <- function(file = "household_power_consumption.txt"){
        
        
        dt <- read.table(file, header = TRUE, sep = ";", dec = ".", 
                         na.strings = "?", 
                         strip.white = FALSE,
                         allowEscapes = FALSE, flush = FALSE)
        
        dt$Date <- as.Date(dt$Date, "%d/%m/%Y")
        
        #2007-02-01 and 2007-02-02        
        names(dt)[1] <- 'Date'
        dt.sub <- subset(dt, format.Date(Date, "%d")=="01" | format.Date(Date, "%d")=="02" & 
                                 format.Date(Date, "%m")=="02" & format.Date(Date, "%y")=="07")
        
        
        
        png(filename="plot2.png", width = 480, height = 480, units = "px")
        hist(dt.sub$Global_active_power, main="Global Active Power", freq = FALSE,
             ylab="Global Active Power (kilowatts)")
        dev.off()
        
}
