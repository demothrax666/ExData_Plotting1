## Setting the working directory
setwd("C:/Users/shaun.ng/R files/datasciencecoursera/ExData_Plotting1")

## Reads the text file and assigning to a variable 'data_all'
data_all <- read.csv("household_power_consumption.txt", header = T, sep = ';', na.strings = "?",
                      nrows = 2075259, check.names = F, stringsAsFactors = F, comment.char = "", quote = '\"')

## Filter dates
data1 <- subset(data_all, Date %in% c("1/2/2007", "2/2/2007"))

## Format dates
data1$Date <- as.Date(data1$Date, format = "%d/%m/%Y")

## To create Histogram
hist(data1$Global_active_power, main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "Red")

## To create PNG
dev.copy(png, file = "Plot1.png", width = 480, height = 480)

dev.off()