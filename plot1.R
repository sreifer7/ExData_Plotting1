setwd("~/Desktop/Data Analytics/Exploratory Analysis") ##set working directory 

energyData <- read.table("energyData.txt", header = TRUE, sep = ";", na.strings = "?") ## Read in

energyData$Date <- as.Date(energyData$Date, "%d/%m/%Y") ## convert to Date class

subsetData <- subset(energyData, Date >= "2007-02-01" & Date <= "2007-02-02") ##Subset by date

png("plot1.png", width = 480, height = 480)

hist(subsetData$Global_active_power, col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")

dev.off()