## Exploratory data analysis
## subset data frame

file <- "household_power_consumption.txt"
df <- read.table(file,sep = ";", header=TRUE)
df$Date=as.Date(df$Date,format="%d/%m/%Y")
sdf <- subset(df, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))

# Plot 3
png("plot3.png", bg = "white", width = 480, height = 480)
plot(strptime(paste(as.character(sdf$Date), as.character(sdf$Time), sep = ""), format = "%Y-%m-%d %H:%M"), as.numeric(levels(sdf$Sub_metering_1)[sdf$Sub_metering_1]), ylab = "Energy sub metering", type = "l", xlab = "")
lines(strptime(paste(as.character(sdf$Date), as.character(sdf$Time), sep = ""), format = "%Y-%m-%d %H:%M"), as.numeric(levels(sdf$Sub_metering_2)[sdf$Sub_metering_2]), ylab = "Energy sub metering", type = "l", xlab = "", col = "red")
lines(strptime(paste(as.character(sdf$Date), as.character(sdf$Time), sep = ""), format = "%Y-%m-%d %H:%M"), sdf$Sub_metering_3, ylab = "Energy sub metering", type = "l", xlab = "", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1,1), col = c("black", "red", "blue"))
dev.off()
