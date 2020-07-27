power <- read.csv("household_power_consumption.txt", header=T, sep=";", na.strings="?")
power2 <- power[power$Date %in% c("1/2/2007", "2/2/2007"),]
View(power2)
SetTime <- strptime(paste(power2$Date, power2$Time, sep=""), "%d/%m/%Y %H:%M:%S")
power3 <- cbind(SetTime, power2)
View(power3)

#plot 1
hist(power3$Global_active_power, col="red", main="Global Active Power", xlab = "Global Active Power (kilowatts)", ylab="Frequency")

# plot 2
plot(power3$Global_active_power~power3$SetTime, type="l", col="black", xlab="", ylab="Global Active Power (kilowatts")