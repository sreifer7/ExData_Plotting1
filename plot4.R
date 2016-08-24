setwd("~/Desktop/Data Analytics/Exploratory Analysis") ##set working directory 

energyData <- read.table("energyData.txt", header = TRUE, sep = ";", na.strings = "?") ## Read in

energyData$Date <- as.Date(energyData$Date, "%d/%m/%Y") ## convert to Date class

subsetData <- subset(energyData, Date >= "2007-02-01" & Date <= "2007-02-03") ##Subset by date

subsetData$DateTime <- paste(subsetData$Date, subsetData$Time, sep = " ") ## Combine Date & Time column

subsetData$DateTime <- strptime(subsetData$DateTime, format = "%Y-%m-%d %H:%M:%S")

png("plot4.png", width = 480, height = 480)

par(mfrow=c(2,2))

with(subsetData, {                       ##Plot first two graphs
  plot(DateTime,Global_active_power, type = "l", ylab="Global Active Power", xlab ="")
  plot(DateTime, Voltage, type = "l", ylab = "Voltage", xlab="datetime")
})

plot(subsetData$DateTime, subsetData$Sub_metering_1, xlab = "", ylab = "Energy sub metering", ##OG Plot of submeter 1
     col="black", type = "l")

lines(subsetData$DateTime, subsetData$Sub_metering_2, col = "red") ## Plot submeter 2

lines(subsetData$DateTime, subsetData$Sub_metering_3, col ="blue") ## Plot submeter 3

legend("topright", lwd = 2, col = c("black", "blue", "red"),             ##Add Legend
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(subsetData$DateTime, subsetData$Global_reactive_power, xlab = "datetime", 
     ylab = "Global_reactive_power", type ="l")

dev.off()
