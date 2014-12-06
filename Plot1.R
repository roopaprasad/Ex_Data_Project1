HPC <- read.csv("household_power_consumption.txt", sep=";", na.strings="?")
HPC2D <- subset(HPC,Date == "1/2/2007" | Date == "2/2/2007")       #Make HPC2D by selecting two dates of February from HPC
HPC2D$DateTime <- paste(HPC2D$Date, HPC2D$Time)      # Add a column DateTime to HPC2D
HPC2D$DateTime <- strptime(HPC2D$DateTime, "%d/%m/%Y %H:%M:%S")       # format time
HPC2D$Day <- weekdays(HPC2D$DateTime, abbreviate=TRUE) # Add a column Day to HPC2D with abbreviated week day
png(filename = "plot1.png", bg = "transparent")        # Create the .PNG file with transparent background
hist(HPC2D$Global_active_power,col="red",main = "Global Active Power", xlab= "Global Active Power (kilowatts)")       #Plot 1 - Histogram
dev.off()                                              # Close .PNG device
