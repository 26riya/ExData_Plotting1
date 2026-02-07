#load data
data <- read.table("household_power_consumption.txt",header = TRUE,sep = ";",na.strings = "?",stringsAsFactors = FALSE)

# Convert Date
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

# required dates for subset
data_subset <- subset(data,Date == as.Date("2007-02-01") |Date == as.Date("2007-02-02"))

# to convert Global_active_power to numeric
data_subset$Global_active_power <- as.numeric(data_subset$Global_active_power)

# to create png with 480x480
png("plot1.png",width=480,height=480)

# to create histogram
hist(data_subset$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)",ylab="Frequency")

dev.off()