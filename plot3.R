## Read in the power data
powerData<-read.table("./data/exdata-data-household_power_consumption/household_power_consumption.txt",sep=";",header=TRUE,na.strings ="?")

## Remove NA rows
powerData<-na.omit(powerData)

## Covert Date column data to Date objects
powerData[,"Date"]<-as.Date(powerData$Date, format="%d/%m/%Y")

## Subset data based on date range
powerData<-powerData[powerData$Date== "2007-02-01" | powerData$Date== "2007-02-02",]

datetime<-paste(powerData$Date, powerData$Time,sep=" ")

powerData<-data.frame(powerData,datetime=strptime(datetime, "%Y-%m-%d %H:%M:%S"))




## open png device
png(filename= "plot3.png",width = 480, height = 480)

## Create Plot
par(bg="transparent")
plot(powerData$datetime,powerData$Sub_metering_1, type="l",ylab="Energy sub metering",xlab="")
lines(powerData$datetime,powerData$Sub_metering_2,type="l",col="Red")
lines(powerData$datetime,powerData$Sub_metering_3,type="l",col="Blue")
legend("topright", legend= c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","blue","red"), lwd=1)

## Close png device
dev.off() 