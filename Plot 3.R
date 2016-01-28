
#Plot 3. 
#importing data, converting dates and subsetting
Power_data <- read.csv("~/exdata-data-household_power_consumption/household_power_consumption.txt" 
                       , sep=";", header = TRUE, stringsAsFactors = FALSE, dec=".")
Power_data$Date <- strptime(Power_data$Date,"%d/%m/%Y")
subPower_data <- subset(Power_data, Date ==  "2007-02-01" | Date == "2007-02-02")
subPower_data[3:9] <- lapply(subPower_data[3:9], as.numeric)
#creating date_time dataset
date_time <- as.data.frame(strptime(paste(subPower_data$Date, subPower_data$Time, sep = " "), "%Y-%m-%d %H:%M:%S")) 
#making the plot
png(filename = "Plot 3.png", width = 480, height = 480)
plot(date_time[,1], subPower_data$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
lines(date_time[,1], subPower_data$Sub_metering_2, type = "l", col="red")
lines(date_time[,1], subPower_data$Sub_metering_3, type = "l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()