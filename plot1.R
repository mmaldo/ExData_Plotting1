## Read in the power data
powerData<-read.table("./data/exdata-data-household_power_consumption/household_power_consumption.txt",sep=";",header=TRUE,na.strings ="?")

## Remove NA rows
powerData<-na.omit(powerData)

## Covert Date column data to Date objects
powerData[,"Date"]<-as.Date(powerData$Date, format="%d/%m/%Y")

## Subset data based on date range
powerData<-powerData[powerData$Date== "2007-02-01" | powerData$Date== "2007-02-02",]

## open png device
png(filename= "plot1.png",width = 480, height = 480)

## Create histogram of Global Active Power
hist(powerData$Global_active_power,main="Global Active Power",xlab="Global Active Power (kilowatts)",col="Red")

## Close png device
dev.off() 