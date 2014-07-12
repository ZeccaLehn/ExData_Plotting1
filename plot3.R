#Plot 3 -- Uses global environment and WD set by user in plot1.R

#Path to PNG Figures
path <- paste(getwd(),"/figure/", sep = "")

## PLOT 3 as PNG
png(paste(path, filename = 'plot3.png', sep ="" ))

#Uses xAxis from plot2.R -- in global environment after running.
yAxis1 <- as.numeric(tidyData$Sub_metering_1) #Y Axis: Sets
yAxis2 <- as.numeric(tidyData$Sub_metering_2) #Y Axis: Sets
yAxis3 <- as.numeric(tidyData$Sub_metering_3) #Y Axis: Sets

#X Axis carries over in global environment from plot2.R
plot(xAxis, yAxis1, ylab = "Energy Sub Metering", xlab = "", type = "l")
lines(xAxis, yAxis2, col = "red", type = "l")
lines(xAxis, yAxis3, col = "blue", type = "l")
legend("topright", lwd=c(2, 2, 2), lty=c(1,1,1), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black","red","blue"))

#Turns of dev environment after plotting to new path       
dev.off()