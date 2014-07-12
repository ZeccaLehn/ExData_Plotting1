#Plot 4 -- Uses global environment and WD set by user in plot3.R

#Path to PNG Figures
path <- paste(getwd(),"/figure/", sep = "")

## PLOT 1 EXAMPLE
png(paste(path, filename = 'plot4.png', sep ="" ))

#Breaks plots into four quarters
par(mfrow=c(2,2)) 

#Loads plot inputs from global environment
#Upper Left Plot -- Active Power
plot(xAxis, yAxis, ylab = "Global Active Power (kilowatts)", xlab = "", type = "l")

#Upper Right -- Voltage
plot(xAxis, as.numeric(tidyData$Voltage), xlab = "", ylab = "Voltage", type = "l", col = "black") 

#Lower Left -- Submetering
#X Axis carries over in global environment from plot2.R
plot(xAxis, yAxis1, ylab = "Energy Sub Metering", xlab = "", type = "l")
lines(xAxis, yAxis2, col = "red", type = "l")
lines(xAxis, yAxis3, col = "blue", type = "l")
legend("topright", lwd=c(2, 2, 2), lty=c(1,1,1), bty = "n", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black","red","blue"))

#Lower Right -- Voltage
plot(xAxis, as.numeric(tidyData$Global_reactive_power), xlab = "", ylab = "Global Reactive Power", type = "l", col = "black") 

#Turns of dev environment after plotting to new path       
dev.off()
dev.off() # One extra for good measure!

