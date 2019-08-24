## Setting the working directory
setwd("C:/Users/shaun.ng/R files/datasciencecoursera/ExData_Plotting1")

## Reads the text file and assigning to a variable 'data_all'
data_all <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

## Filter dates
data1 <- subset(data_all, Date %in% c("1/2/2007","2/2/2007"))

## Format dates
data1$Date <- as.Date(data1$Date, format="%d/%m/%Y")

datetime <- paste(as.Date(data1$Date), data1$Time)

data1$Datetime <- as.POSIXct(datetime)

## To create plot
with(data1, {
        plot(Sub_metering_1~Datetime, type="l",
             ylab="Global Active Power (kilowatts)", xlab="")
        lines(Sub_metering_2~Datetime,col='Red')
        lines(Sub_metering_3~Datetime,col='Blue')
})

## To create the required legends
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## To create PNG
dev.copy(png, file = "Plot3.png", width = 480, height = 480) ## width is not enough to display full legend!

dev.off()