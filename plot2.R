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

png("plot2.png", width = 480, height = 480)
plot(input, as.character(dat$Global_active_power), type = "l", ylab = "Global Active Power (kilowatts)", xlab ="")

dev.off()