#Plot 2 -- Uses global environment and WD set by user in plot1.R

#Path to PNG Figures
path <- paste(getwd(),"/figure/", sep = "")

## PLOT 2 PNG
png(paste(path, filename = 'plot2.png', sep ="" ))

xAxis <- strptime(paste(tidyData$Date, tidyData$Time), "%d/%m/%Y %H:%M:%S") # X Axis: Pastes Dates and Times and formats with strptime
yAxis <- as.numeric(tidyData$Global_active_power) #Y Axis: Sets
plot(xAxis, yAxis, ylab = "Global Active Power (kilowatts)", xlab = "", type = "l")

#Turns of dev environment after plotting to new path       
dev.off()

