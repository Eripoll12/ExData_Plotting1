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


## Make Plot 3
windows()
with(myData,plot(t, Submetering_1, type = "n", xlab="",
     ylab = "Energy sub metering"))
with(myData, lines (t, Submetering_1, col = "black"))
with(myData, lines (t, Submetering_2, col = "red"))
with(myData, lines (t, Submetering_3, col = "blue"))
legend("topright", col = c("black","blue", "red"), 
       legend = c("Sub_metering_1   ","Sub_metering_2   ","Sub_metering_3   "), lty=1)


## Save Plot 3
dev.copy(png, filename = "./Course_4/Assignment_1/plot3.png", width = 480, height = 480)
dev.off()