power <- read.csv("household_power_consumption.txt", header=T, sep=";", na.strings="?")
power2 <- power[power$Date %in% c("1/2/2007", "2/2/2007"),]
View(power2)
SetTime <- strptime(paste(power2$Date, power2$Time, sep=""), "%d/%m/%Y %H:%M:%S")
power3 <- cbind(SetTime, power2)
View(power3)
t <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))

## Format date to Type Date
t$Date <- as.Date(t$Date, "%d/%m/%Y")

## Filter data set from Feb. 1, 2007 to Feb. 2, 2007
t <- subset(t,Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))

## Remove incomplete observation
t <- t[complete.cases(t),]

## Combine Date and Time column
dateTime <- paste(t$Date, t$Time)

## Name the vector
dateTime <- setNames(dateTime, "DateTime")

## Remove Date and Time column
t <- t[ ,!(names(t) %in% c("Date","Time"))]

## Add DateTime column
t <- cbind(dateTime, t)

## Format dateTime Column
t$dateTime <- as.POSIXct(dateTime)

#plot 1
hist(power3$Global_active_power, col="red", main="Global Active Power", xlab = "Global Active Power (kilowatts)", ylab="Frequency")
## Save file and close device
dev.copy(png,"plot1.png", width=480, height=480)
dev.off()


# plot 2
plot(power3$Global_active_power~power3$SetTime, type="l", col="black", xlab="", ylab="Global Active Power (kilowatts")
dev.copy(png,"plot2.png", width=480, height=480)
dev.off()



