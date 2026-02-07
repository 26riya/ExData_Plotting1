# Load data
data <- read.table("household_power_consumption.txt",header = TRUE,sep = ";",na.strings = "?",stringsAsFactors = FALSE)

# Convert Global_active_power to numeric
data$Global_active_power <- as.numeric(data$Global_active_power)

# Create POSIXct directly from original Date + Time
data$DateTime <- as.POSIXct(paste(data$Date, data$Time),format = "%d/%m/%Y %H:%M:%S")

# Subset required dates using DateTime
data_subset <- data[data$DateTime >= as.POSIXct("2007-02-01") &data$DateTime <  as.POSIXct("2007-02-03"),]

# Create PNG
png("plot2.png", width = 480, height = 480)

plot(data_subset$DateTime,data_subset$Global_active_power,type = "l",xlab = "",ylab = "Global Active Power (kilowatts)",xaxt = "n")

# Remove default axis completely and add weekday labels only
axis(1,at = as.POSIXct(c("2007-02-01","2007-02-02","2007-02-03")),labels = c("Thu", "Fri", "Sat"))

dev.off()
