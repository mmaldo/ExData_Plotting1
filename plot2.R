## Read in the power data
powerData<-read.table("./data/exdata-data-household_power_consumption/household_power_consumption.txt",sep=";",header=TRUE,na.strings ="?")

## Remove NA rows
powerData<-na.omit(powerData)

## Covert Date column data to Date objects
powerData[,"Date"]<-as.Date(powerData$Date, format="%d/%m/%Y")

## Subset data based on date range
powerData<-powerData[powerData$Date== "2007-02-01" | powerData$Date== "2007-02-02",]

## Combine date and time columns, seperating by a space
datetime<-paste(powerData$Date, powerData$Time,sep=" ")

## convert new date time column to POSIXlt
powerData<-data.frame(powerData,datetime=strptime(datetime, "%Y-%m-%d %H:%M:%S"))


## open png device, width and height are 480
png(filename= "plot2.png",width = 480, height = 480)

## Create Plot
## Set Transparent backround
par(bg="transparent")
## plot Global Avtive Power vs datetime, type = line plot, line thickness is 1, x label is empty, y label is 
## "Global Active Power (kilowatts)"
plot(powerData$datetime,powerData$Global_active_power,type="l", lwd = 1,xlab="",ylab="Global Active Power (kilowatts)")

## Close png device
dev.off() 