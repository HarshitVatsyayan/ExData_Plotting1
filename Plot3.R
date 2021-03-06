#Loading library
library(tidyverse)

#Downloading Data, and unzipping it.
URL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
filedes <- "C:/Users/MAHE/Documents/JHU Data Science/datasciencecoursera/datasciencecoursera/ExData_Plotting1/ElectricPowerConsumption.zip"
download.file(URL, filedes)
unzip("C:/Users/MAHE/Documents/JHU Data Science/datasciencecoursera/datasciencecoursera/ExData_Plotting1/ElectricPowerConsumption.zip")

#Read Data
HPC <- read.table("./household_power_consumption.txt",sep=";", header=TRUE,na.strings="?")
head(HPC)

#Creat new variable with both date and time and converting it to date class. 
HPC$DT <- paste(HPC$Date, HPC$Time)
HPC$DT <- strptime(HPC$DT, format="%d/%m/%Y %H:%M:%S")
HPC$Date <- strptime(HPC$Date, format="%d/%m/%Y")

#Subsetting required values.
HPCNew <- subset(HPC, Date == "2007-02-01" | Date == "2007-02-02")
head(HPCNew)

#Creating required plot
png("plot3.png",  width = 480, height = 480, units = "px")
plot(HPCNew$DT, HPCNew$Sub_metering_1, type="n", ylim=c(0,40),ylab="Energy sub metering", xlab="")
lines(HPCNew$DT, HPCNew$Sub_metering_1, type="l", col="black")
lines(HPCNew$DT, HPCNew$Sub_metering_2, type="l", col="red")
lines(HPCNew$DT, HPCNew$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1,1), lwd=c(2,2,2), col=c("black","red","blue"))
dev.off()