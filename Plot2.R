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


## Make Plot 2
windows()
with(myData,plot(t, Global_active_power, type="l",
             xlab="", ylab = "Global Active Power (kilowatts)"))


## Save Plot 2
dev.copy(png, filename = "./Course_4/Assignment_1/plot2.png", width = 480, height = 480)
dev.off()