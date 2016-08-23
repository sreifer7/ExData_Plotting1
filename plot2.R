setwd("~/Desktop/Data Analytics/Exploratory Analysis") ##set working directory 

energyData <- read.table("energyData.txt", header = TRUE, sep = ";", na.strings = "?") ## Read in

energyData$Date <- as.Date(energyData$Date, "%d/%m/%Y") ## convert to Date class

subsetData <- subset(energyData, Date >= "2007-02-01" & Date <= "2007-02-03") ##Subset by date

subsetData$DateTime <- paste(subsetData$Date, subsetData$Time, sep = " ") ## Combine Date & Time column

subsetData$DateTime <- strptime(subsetData$DateTime, format = "%Y-%m-%d %H:%M:%S")

plot(subsetData$DateTime,subsetData$Global_active_power, xlab = "", ##plot graph, no lines
     ylab = "Global Active Power (kilowatts)", type = "l")

dev.copy2pdf(file = "plot2.pdf")

dev.off()