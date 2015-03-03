filename <- "household_power_consumption.txt"

# need to set it up in order to see english daynames
Sys.setlocale(locale="C")

data <- read.table(filename, header=T, sep=';', na.strings="?",
                   colClasses=c("character", "character", "numeric",
                                "numeric", "numeric", "numeric",
                                "numeric", "numeric", "numeric"))

data <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]
data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

png(filename = "plot2.png", width = 480, height = 480, units = "px")
plot(data$DateTime, data$Global_active_power, type="l",
     xlab="", ylab="Global Active Power (kilowatts)")

dev.off()
