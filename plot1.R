## The dataset has 2,075,259 rows and 9 columns. First calculate a rough estimate
## of how much memory the dataset will require in memory before reading into R.
## Make sure your computer has enough memory (most modern computers should be
## fine).
#
# > (2075259 * 9 * 8) / (2^20)
# [1] 142.4967
# (rough in megabytes)
# actual usage according to linux's free(1) is 246856 kilobytes. Not so much =)

data <- read.table("household_power_consumption.txt", sep=";", 
                   dec = ".", header=T, na.strings="?")

# no need to transform Date to proper date format, selecting as fixed strings

data <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]

# only 2880 observations, no NA's

data$Global_active_power = as.character(data$Global_active_power)
data$Global_active_power = as.numeric(data$Global_active_power)

png(filename = "plot1.png", width = 480, height = 480)
hist(data$Global_active_power, col = "red",
     xlab = "Global Active Power (kilowatts)",
     main="Global Active Power", axes=F,breaks=12)
axis(1, c(0,2,4,6))
axis(2, c(0,200,400,600,800,1000,1200))

dev.off()
