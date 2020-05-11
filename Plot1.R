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

#Creating required histogram
png("plot1.png", width = 480, height = 480, units = "px")
hist(HPCNew$Global_active_power, main="Global Active Power", xlab="Global Active Power (Kilowatts)", col = "red")
dev.off()
