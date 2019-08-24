## Setting the working directory
setwd("C:/Users/shaun.ng/R files/datasciencecoursera/ExData_Plotting1")

## Reads the text file and assigning to a variable 'data_all'
data_all <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

## Filter dates
data1 <- subset(data_all, Date %in% c("1/2/2007","2/2/2007"))

## Format dates
data1$Date <- as.Date(data1$Date, format="%d/%m/%Y")

datetime <- paste(as.Date(data1$Date), data1$Time)

data1$Datetime <- as.POSIXct(datetime)

## To create plot
with(data1, {
        plot(Global_active_power~Datetime, type="l",
             ylab="Global Active Power (kilowatts)", xlab="")})

## To create PNG
dev.copy(png, file = "Plot2.png", width = 480, height = 480)

dev.off()