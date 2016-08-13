#Download file from url and then unzip the file
download.file(url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile ="eletric_power_consumption.txt")
sample.file <- unzip("eletric_power_consumption")
f <- read.table(sample.file, sep = ";", header = TRUE)

#Subset data only from 02/01/2007 to 02/02/2007
dat <- f[f$Date == "1/2/2007" | f$Date == "2/2/2007",]

#Change the formats for dat and time
Date.pre <- gsub("2007", "07", as.character(dat$Date))
Date.format <- as.Date(Date.pre, "%d/%m/%y" )
Date.time<- paste(Date.format, dat$Time)
input <- strptime(Date.time, "%Y-%m-%d %H:%M:%S")

png("plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))

plot(input, as.character(dat$Global_active_power), type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

plot(input, as.character(dat$Voltage), type = "l", ylab = "Voltage", xlab = "datetime")

plot(input, as.character(dat$Sub_metering_1), type = "l", ylab = "Energy sub metering", xlab = "")
par(new = T)
plot(input, as.character(dat$Sub_metering_2), type = "l", col = "red", ylab = "", xlab = "", axes = F, ylim = c(0, 50))
par(new = T)
plot(input, as.character(dat$Sub_metering_3), type = "l", col = "blue", axes = F, ylab = "", xlab = "", ylim = c(0,35))
leg.txt <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
legend('topright', leg.txt, col = c("black", "red", "blue"), lty = 1)

plot(input, as.character(dat$Global_reactive_power), type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()