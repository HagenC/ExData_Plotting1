
#importing data, converting dates and subsetting
Power_data <- read.csv("~/exdata-data-household_power_consumption/household_power_consumption.txt" 
                       , sep=";", header = TRUE, stringsAsFactors = FALSE, dec=".")
Power_data$Date <- strptime(Powere_data$Date,"%d/%m/%Y")
subPower_data <- subset(Power_data, Date ==  "2007-02-01" | Date == "2007-02-02")
subPower_data[3:9] <- lapply(subPower_data[3:9], as.numeric)

#Plot 1. 
setwd("C:/Users/UNC/Desktop/R_Coursera/Exploratory Data Analysis/")
png(filename = "Plot 1.png", width = 480, height = 480)
hist(subPower_data$Global_active_power, col= "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()