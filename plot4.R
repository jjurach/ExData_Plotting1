
df <- read.csv("power_subset.txt", sep=";", na.strings = "?")
df$timestamp <- as.POSIXlt(paste(df$Date, df$Time), format="%d/%m/%Y %H:%M:%S")

png('plot4.png', width=480, height=480)
par(mfrow=c(2,2))

## Plot 1

plot(df$timestamp, as.numeric(df$Global_active_power),
     ylab = "Global Active Power",
     xlab = "",
     type = "l"
)

## Plot 2

plot(df$timestamp, as.numeric(df$Voltage),
     ylab = "Voltage",
     xlab = "datetime",
     type = "l"
)

## Plot 3

plot(df$timestamp, as.numeric(df$Sub_metering_1),
     ylab = "Energy sub metering",
     xlab = "",
     type = "n"
)
lines(df$timestamp, as.numeric(df$Sub_metering_1),col="black")
lines(df$timestamp, as.numeric(df$Sub_metering_2),col="red")
lines(df$timestamp, as.numeric(df$Sub_metering_3),col="blue")
legend("topright",
       lty=c(1,1,1),
       bty="n",
       col=c("black","red","blue"),
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Plot 4

plot(df$timestamp, as.numeric(df$Global_reactive_power),
     ylab = "Global_reactive_power",
     xlab = "datetime",
     type = "l"
)

dev.off()