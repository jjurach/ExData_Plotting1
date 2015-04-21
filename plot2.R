
df <- read.csv("power_subset.txt", sep=";", na.strings = "?")
df$timestamp <- as.POSIXlt(paste(df$Date, df$Time), format="%d/%m/%Y %H:%M:%S")

png('plot2.png', width=480, height=480)
plot(df$timestamp, as.numeric(df$Global_active_power),
     ylab = "Global Active Power (kilowatts)",
     xlab = "",
     type = "l"
)
dev.off()