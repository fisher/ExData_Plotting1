filename <- "household_power_consumption.txt"

# need to set it up in order to see english daynames
Sys.setlocale(locale="C")

data <- read.table(filename, header=T, sep=';', na.strings="?",
                   colClasses=c("character", "character", "numeric",
                                "numeric", "numeric", "numeric",
                                "numeric", "numeric", "numeric"))

data <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]
data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

png(filename = "plot3.png", width = 480, height = 480, units = "px")

plot(data$DateTime, data$Sub_metering_1, type="l",
     xlab="", ylab="Energy sub metering")

lines(data$DateTime, data$Sub_metering_2, type="l", col="red")
lines(data$DateTime, data$Sub_metering_3, type="l", col="blue")

legend("topright", lty=1, lwd=1,
       col=c("black", "blue", "red"),
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()
