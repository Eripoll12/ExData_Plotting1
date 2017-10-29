# Read only the data we are interested in (from 1/2/2007 to 2/2/2007)


myData <- read.table(text = grep("^[1,2]/2/2007", readLines("./Course_4/Assignment_1/household_power_consumption.txt"),
                                 value = TRUE), sep=";", na.strings = "?")
colnames(myData) <- c("Date", "Time", "Global_active_power", "Global_reactive_power",
                      "Voltage", "Global_intensity", "Submetering_1", "Submetering_2", 
                      "Submetering_3")


## Make Plot 1
hist(myData$Global_active_power, col = "red", main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")


## Save Plot 1
dev.copy(png, filename = "./Course_4/Assignment_1/plot1.png", width = 480, height = 480)
dev.off()