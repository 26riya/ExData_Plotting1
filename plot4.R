# Load data
data <- read.table("household_power_consumption.txt",header = TRUE,sep = ";",na.strings = "?",stringsAsFactors = FALSE)

# to convert required columns to numeric
data$Global_active_power   <- as.numeric(data$Global_active_power)
data$Voltage               <- as.numeric(data$Voltage)
data$Global_reactive_power <- as.numeric(data$Global_reactive_power)
data$Sub_metering_1        <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2        <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3        <- as.numeric(data$Sub_metering_3)

# to create DateTime
data$DateTime <- as.POSIXct(paste(data$Date, data$Time),format = "%d/%m/%Y %H:%M:%S")

# Subset dates
data_subset <- data[data$DateTime >= as.POSIXct("2007-02-01") &data$DateTime <  as.POSIXct("2007-02-03"),]

# to create PNG
png("plot4.png", width = 480, height = 480)

par(mfrow = c(2,2))

# plot 1
plot(data_subset$DateTime,data_subset$Global_active_power,type = "l",xlab = "",ylab = "Global Active Power",xaxt = "n")

axis(1,at = as.POSIXct(c("2007-02-01","2007-02-02","2007-02-03")),labels = c("Thu", "Fri", "Sat"))

# plot 2
plot(data_subset$DateTime,data_subset$Voltage,type = "l",xlab = "datetime",ylab = "Voltage",xaxt = "n")

axis(1,at = as.POSIXct(c("2007-02-01","2007-02-02","2007-02-03")),labels = c("Thu", "Fri", "Sat"))

# plot 3
plot(data_subset$DateTime,data_subset$Sub_metering_1,type = "l",xlab = "",ylab = "Energy sub metering",col = "black",xaxt = "n")

lines(data_subset$DateTime,data_subset$Sub_metering_2,col = "red")

lines(data_subset$DateTime,data_subset$Sub_metering_3,col = "blue")

axis(1,at = as.POSIXct(c("2007-02-01","2007-02-02","2007-02-03")),labels = c("Thu", "Fri", "Sat"))

legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col = c("black", "red", "blue"),lty = 1,bty = "n",cex = 0.8)

# plot 4
plot(data_subset$DateTime,data_subset$Global_reactive_power,type = "l",xlab = "datetime",ylab = "Global_reactive_power",xaxt = "n")

axis(1,at = as.POSIXct(c("2007-02-01","2007-02-02","2007-02-03")),labels = c("Thu", "Fri", "Sat"))

dev.off()
