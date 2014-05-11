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
png(filename= "plot4.png",width = 480, height = 480)

## Create Plot
## set to 2 plots per row and 2 columns
par(mfrow=c(2,2),bg="transparent")
## Create plot of Global Active Power vs datetime
plot(powerData$datetime,powerData$Global_active_power,type="l", lwd = 1,xlab="",ylab="Global Active Power (kilowatts)")
## Create plot of Voltage vs datetime
plot(powerData$datetime,powerData$Voltage,type="l", lwd = 1,xlab="datetime",ylab="Voltage")
## Create plot of Sub_metering vs datetime
plot(powerData$datetime,powerData$Sub_metering_1, type="l",ylab="Energy sub metering",xlab="")
lines(powerData$datetime,powerData$Sub_metering_2,type="l",col="Red")
lines(powerData$datetime,powerData$Sub_metering_3,type="l",col="Blue")
legend("topright", legend= c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","blue","red"), lwd=1)
## Create plot of Global Reactive Power vs datetime
plot(powerData$datetime,powerData$Global_reactive_power,type="l", lwd = 0.1,xlab="datetime",ylab="Global_reactive_power",col=rgb(0,0,0,255,maxColorValue=255))

## Close png device
dev.off() 