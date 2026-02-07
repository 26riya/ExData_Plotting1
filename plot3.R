# Load data
data <- read.table("household_power_consumption.txt",header = TRUE,sep = ";",na.strings = "?",stringsAsFactors = FALSE)

# Convert sub metering columns to numeric
data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)

# Create DateTime
data$DateTime <- as.POSIXct(paste(data$Date, data$Time),format = "%d/%m/%Y %H:%M:%S")

# Subset required dates
data_subset <- data[data$DateTime >= as.POSIXct("2007-02-01") &data$DateTime <  as.POSIXct("2007-02-03"),]

# Create PNG
png("plot3.png", width = 480, height = 480)

plot(data_subset$DateTime,data_subset$Sub_metering_1,type = "l",xlab = "",ylab = "Energy sub metering",col = "black",xaxt = "n")

lines(data_subset$DateTime,data_subset$Sub_metering_2,col = "red")

lines(data_subset$DateTime,data_subset$Sub_metering_3,col = "blue")

# Force weekday labels exactly
axis(1,at = as.POSIXct(c("2007-02-01","2007-02-02","2007-02-03")),labels = c("Thu", "Fri", "Sat"))

legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col = c("black", "red", "blue"),lty = 1,bty = "n")

dev.off()
