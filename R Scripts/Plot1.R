##set working directory where data is stored
setwd("~/datasciencecoursera")

##reading the data 
powerdata <- read.table("~/datasciencecoursera/household_power_consumption.txt", sep = ";", header = TRUE,na.strings = "?")

##subsetting data which is useful for analysis
powerdata1 <- powerdata[powerdata$Date %in% c("1/2/2007", "2/2/2007"), ]

##ensuring class of data is correct and omit NA values
as.Date(powerdata1$Date)
as.numeric(powerdata1$Global_active_power)
na.omit(powerdata1)

##plotting the histogram graph in PNG output
png(filename = "Plot1.png", width = 480,height = 480)
hist(powerdata1$Global_active_power, col = "red", xlab = "Global Active Power(kilowatts)", ylab = "Frequency", main = "Global Active Power" )
dev.off()

