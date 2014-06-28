## Read in the power data
powerData<-read.table(unz("./data/exdata-data-household_power_consumption.zip","household_power_consumption.txt"), sep=";",header=TRUE,na.strings ="?")


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
png(filename= "plot3.png",width = 480, height = 480)

## Create Plot
## set backround to Transparent
par(bg="transparent")
## Create base plot with sub_metering_1 vs datetime,type = line plot, x label is empty, y label is
## "Energy sub metering", sub_metering_1 is represented with a black line
plot(powerData$datetime,powerData$Sub_metering_1, type="l",ylab="Energy sub metering",xlab="")
## add sub_metering_2 line to plot as a red line
lines(powerData$datetime,powerData$Sub_metering_2,type="l",col="Red")
## add sub_metering_3 line to plot as a blue line
lines(powerData$datetime,powerData$Sub_metering_3,type="l",col="Blue")
## add a legend to the top right of plot, line thickness in legend  is 1
legend("topright", legend= c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","blue","red"), lwd=1)

## Close png device
dev.off() 