##Create Plot 1 
#Set your working directory here first
        
        setwd('/home/southbaypc/GitZ/Data_Exploration/ExData_Plotting1')
        list.files(getwd())
        
        library(data.table) #For faster download and sort

        #Checks your chosen Working Directory for the folder named "data", and creates it in the directory
        #if it does not already exist.

                if(!file.exists("./data")){dir.create("./data")}

        #Downloads .zip from link and directly extracts to the "./data" folder

                temp <- tempfile() #Creates a temporary linked file within the temp directory.
                download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
                unzip(temp, exdir = "./data") #Extracts zip file to ./data folder
                unlink(temp) #Unlinks temp file from 'tmp' folder

        #Names unzipped in ./data folder, based on existing file name

                nameDownload <- list.files("./data")

#Sets data folder as temporary subdirectory 

        #Sets data folder as path to unzipped download
        
        path <- paste("./data/", nameDownload, sep = "")
        #data <- read.table(path, header = TRUE, sep = ";") #Slower Alternative
        data <- fread(path) #Uses data.table package for quicker load
        
        dates <- as.Date(data$Date, format="%d/%m/%Y") # Vector of date strings without time
        
        rowNums <- which(dates >= '2007-02-01' & dates <= '2007-02-02') #Returns rownums within set range        
       
        tidyData <- as.data.frame(data[rowNums]) #Applies rowNums to sub range of table
        tidyData <- tidyData[, c("Date", "Time", "Global_active_power",
                                 "Sub_metering_1", "Sub_metering_2", "Sub_metering_3",
                                        "Voltage", "Global_reactive_power")] #Includes Columns for carry over
        head(tidyData)
        #str(tidyData)
        
        
#Plot 1
        
        #Path to PNG Figures
        path <- paste(getwd(),"/figure/", sep = "")
               
        ## Plot 1 as PNG
        png(paste(path, filename = 'plot1.png', sep ="" ))
           
        hist(as.numeric(tidyData$Global_active_power), main = "Global Active Power",
             xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "red") #Plots histogram of one day Global_active_power
        
        #Turns of dev environment after plotting to new path       
        dev.off()
        

        
        
        
        
        
