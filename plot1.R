## Exploratory data analysis
## subset data frame

file <- "household_power_consumption.txt"
df <- read.table(file,sep = ";", header=TRUE)
df$Date=as.Date(df$Date,format="%d/%m/%Y")
sdf <- subset(df, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))

# Plot 1
png("plot1.png", bg = "white", width = 480, height = 480)
hist(as.numeric(levels(sdf$Global_active_power)[sdf$Global_active_power]), col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
