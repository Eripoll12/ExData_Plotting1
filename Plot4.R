# Read only the data we are interested in (from 1/2/2007 to 2/2/2007)


myData <- read.table(text = grep("^[1,2]/2/2007", readLines("./Course_4/Assignment_1/household_power_consumption.txt"),
                                 value = TRUE), sep=";", na.strings = "?")
colnames(myData) <- c("Date", "Time", "Global_active_power", "Global_reactive_power",
                      "Voltage", "Global_intensity", "Submetering_1", "Submetering_2", 
                      "Submetering_3")


## Convert Data and Time
t <- paste(as.Date(myData$Date, format="%d/%m/%Y"), myData$Time)
myData$t <- as.POSIXct(t)
Sys.setlocale("LC_TIME", "English") # Changing date axix time to English


## Make Plot 4
windows()
par(mfrow=c(2,2))

## plot 4_1
with(myData,plot(t, Global_active_power, type="l",
                 xlab="", ylab = "Global Active Power (kilowatts)"))

## plot 4_2
with(myData,plot(t, Voltage, type="l", xlab="datetime", ylab = "Voltage"))

##plot 4_3
with(myData,plot(t, Submetering_1, type = "n", xlab="",
                 ylab = "Energy sub metering"))
with(myData, lines (t, Submetering_1, col = "black"))
with(myData, lines (t, Submetering_2, col = "red"))
with(myData, lines (t, Submetering_3, col = "blue"))
legend("topright", col = c("black","blue", "red"), 
       legend = c("Sub_metering_1 ","Sub_metering_2 ","Sub_metering_3 "), lty=1)

##plot 4_4
with(myData,plot(t, Global_reactive_power, type="l", xlab="datetime",
                 ylab = "Global_reactive_power"))


## Save Plot 4
dev.copy(png, filename = "./Course_4/Assignment_1/plot4.png", width = 480, height = 480)
dev.off()