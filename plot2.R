## Exploratory data analysis
## subset data frame

file <- "household_power_consumption.txt"
df <- read.table(file,sep = ";", header=TRUE)
df$Date=as.Date(df$Date,format="%d/%m/%Y")
sdf <- subset(df, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))

# Plot 2
png("plot2.png", bg = "white", width = 480, height = 480)
plot(strptime(paste(as.character(sdf$Date), as.character(sdf$Time), sep = ""), format = "%Y-%m-%d %H:%M"), as.numeric(levels(sdf$Global_active_power)[sdf$Global_active_power]), ylab = "Global Active Power (kilowatts)", type = "l",xlab = "")
dev.off()
