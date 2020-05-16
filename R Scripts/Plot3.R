##set working directory where data is stored
setwd("~/datasciencecoursera")

##reading the data 
powerdata <- read.table("~/datasciencecoursera/household_power_consumption.txt", sep = ";", header = TRUE,na.strings = "?")

##subsetting data which is useful for analysis
powerdata1 <- powerdata[powerdata$Date %in% c("1/2/2007", "2/2/2007"), ]

##ensuring class of data is correct and omit NA values
as.Date(powerdata1$Date)
as.numeric(powerdata1$Global_active_power)
as.numeric(powerdata1$Sub_metering_1)
as.numeric(powerdata1$Sub_metering_2)
as.numeric(powerdata1$Sub_metering_3)
na.omit(powerdata1)

##defining new variable date time by pasting together 
datetime <- as.POSIXct(paste(powerdata1$Date,powerdata1$Time), format = "%d/%m/%Y %H:%M:%S")
##binding and creating new column
powerdata1 <- cbind(powerdata1 ,datetime)

##plotting the required graph in PNG output
png(filename = "Plot3.png", width = 480,height = 480)
with(powerdata1, plot(datetime, powerdata1$Sub_metering_1, type = "l", ylab = "Energy Sub Metering",xlab = "",))
points(datetime, powerdata1$Sub_metering_2, type ="l", col= "Red")
points(datetime, powerdata1$Sub_metering_3, type ="l", col= "Blue")
legend("topright", pch = "-", col = c("black","red","blue"), legend = c("Sub_metering1","Sub_metering2","Sub_metering3"))
dev.off()


