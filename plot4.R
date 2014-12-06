HPC <- read.csv("household_power_consumption.txt", sep=";", na.strings="?")
HPC2D <- subset(HPC,Date == "1/2/2007" | Date == "2/2/2007")       #Make HPC2D by selecting two dates of February from HPC
HPC2D$DateTime <- paste(HPC2D$Date, HPC2D$Time)      # Add a column DateTime to HPC2D
HPC2D$DateTime <- strptime(HPC2D$DateTime, "%d/%m/%Y %H:%M:%S")       # format time
HPC2D$Day <- weekdays(HPC2D$DateTime, abbreviate=TRUE) # Add a column Day to HPC2D with abbreviated week day
png(filename = "plot4.png", bg = "transparent")        # Create the .PNG file with transparent background
par(mfrow=c(2,2))  # multiple plots as 2X2 matrix
plot(HPC2D$DateTime,HPC2D$Global_active_power, type="l",ylab = "Global Active Power (in kiloWatts)", xlab = " ")      #Plot 1 of 4 upper left  - Global Active Power over DateTime
plot(HPC2D$DateTime,HPC2D$Voltage, type="l",ylab = "Voltage", xlab = "Date Time ")                                    #Plot 2 of 4 upper right - Voltage over Date time
plot(HPC2D$DateTime,SubM[,1],type="l",ylim=c(min(SubM),max(SubM)),col="black",lty = 1,xlab = " ",ylab="Energy Sub Metering",lwd=1)
lines(HPC2D$DateTime,SubM[,2],type="l",col="red",lty=1,lwd=1)
lines(HPC2D$DateTime,SubM[,3],type="l",col="blue",lty=1,lwd=1)                                                       #Plot #3 of 4 - Sub Metering over Date time
legend("topright",legend=colnames(SubM),lty=c(1,1,1),col=c("black","red","blue"),bg="transparent",lwd=1)                     # Plot #3 of 4 - Legend at Top Right Corner
plot(HPC2D$DateTime,HPC2D$Global_reactive_power, type="l",ylab = "Global Reactive Power (in kiloWatts)", xlab = "Date Time ") #Plot 4 of 4 lower right - Global Reactive Power over Date Time
dev.off()                                              # Close .PNG device