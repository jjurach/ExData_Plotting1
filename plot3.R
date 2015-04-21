
df <- read.csv("power_subset.txt", sep=";", na.strings = "?")
df$timestamp <- as.POSIXlt(paste(df$Date, df$Time), format="%d/%m/%Y %H:%M:%S")

png('plot3.png', width=480, height=480)
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
       col=c("black","red","blue"),
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
#legend("topright")
dev.off()