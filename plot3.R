HPC <- read.csv("household_power_consumption.txt", sep=";", na.strings="?")
HPC2D <- subset(HPC,Date == "1/2/2007" | Date == "2/2/2007")       #Make HPC2D by selecting two dates of February from HPC
HPC2D$DateTime <- paste(HPC2D$Date, HPC2D$Time)      # Add a column DateTime to HPC2D
HPC2D$DateTime <- strptime(HPC2D$DateTime, "%d/%m/%Y %H:%M:%S")       # format time
HPC2D$Day <- weekdays(HPC2D$DateTime, abbreviate=TRUE) # Add a column Day to HPC2D with abbreviated week day
png(filename = "plot3.png", bg = "transparent")        # Create the .PNG file with transparent background
SubM <- subset(HPC2D,select = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
plot(HPC2D$DateTime,SubM[,1],type="l",ylim=c(min(SubM),max(SubM)),col="black",lty = 1,xlab = " ",ylab="Energy Sub Metering",lwd=1)
lines(HPC2D$DateTime,SubM[,2],type="l",col="red",lty=1,lwd=1)
lines(HPC2D$DateTime,SubM[,3],type="l",col="blue",lty=1,lwd=1)                                                       #Plot #3 - Sub Metering over Date time
legend("topright",legend=colnames(SubM),lty=c(1,1,1),col=c("black","red","blue"),bg="transparent",lwd=1)                     # Plot #3 - Legend at Top Right Corner
dev.off()                        # Close .PNG device