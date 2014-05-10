library(data.table) #loads data.table package to be able to use fread() function
DataSet<-fread("household_power_consumption.txt",
               select=c("Date","Global_active_power","Voltage","Global_reactive_power","Sub_metering_1","Sub_metering_2","Sub_metering_3")) #uploads columns required 
ReducedData<-subset(DataSet,DataSet$Date %in% c("1/2/2007","2/2/2007"))#subset the data for days chosen

par(mfrow=c(2,2))#we divide the graph in 4 spaces
par(mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))
par(cex.lab=0.6)
par(cex.axis=0.6)

#First graph
plot(as.numeric(ReducedData$Global_active_power),type="l",
     ylab="Global Active Power (kilowatts)",
     xaxt = "n",xlab= "")# creates the graph

z<-as.Date(ReducedData$Date  ,format="%d/%m/%Y")#creates vector with dates for x axis

axis(1, at=1,labels=weekdays(z[1],abbreviate=TRUE))#adds first day in x axis
axis(1, at=length(z),labels=weekdays(z[length(z)]+1,abbreviate=TRUE))#adds last day in x axis
axis(1, at=(length(z)/2)+1,labels=weekdays(z[length(z)/2]+1,abbreviate=TRUE))#adds mid day in x axis

#second graph
plot(as.numeric(ReducedData$Voltage),type="l",
     xlab="datetime",ylab="Voltage",
     xaxt = "n")# creates the graph

z<-as.Date(ReducedData$Date  ,format="%d/%m/%Y")#creates vector with dates for x axis

axis(1, at=1,labels=weekdays(z[1],abbreviate=TRUE))#adds first day in x axis
axis(1, at=length(z),labels=weekdays(z[length(z)]+1,abbreviate=TRUE))#adds last day in x axis
axis(1, at=(length(z)/2)+1,labels=weekdays(z[length(z)/2]+1,abbreviate=TRUE))#adds mid day in x axis

#third graph

plot(as.numeric(ReducedData$Sub_metering_1),type="l",
     ylab="Energy sub metering",
     xaxt = "n",xlab= "")# creates the graph
lines(as.numeric(ReducedData$Sub_metering_2),col="red")
lines(as.numeric(ReducedData$Sub_metering_3),col="blue")


legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       cex=0.6,pch="_",col=c("black","red","blue"),
       xjust=0,adj=0,bty="n") #adds the legend in th top right corner

z<-as.Date(ReducedData$Date  ,format="%d/%m/%Y")#creates vector with dates for x axis

axis(1, at=1,labels=weekdays(z[1],abbreviate=TRUE))#adds first day in x axis
axis(1, at=length(z),labels=weekdays(z[length(z)]+1,abbreviate=TRUE))#adds last day in x axis
axis(1, at=(length(z)/2)+1,labels=weekdays(z[length(z)/2]+1,abbreviate=TRUE))#adds mid day in x axis

#fourth graph
plot(as.numeric(ReducedData$Global_reactive_power),type="l",
     xlab="datetime",ylab="Global_Reactive_Power",
     xaxt = "n")# creates the graph

z<-as.Date(ReducedData$Date  ,format="%d/%m/%Y")#creates vector with dates for x axis

axis(1, at=1,labels=weekdays(z[1],abbreviate=TRUE))#adds first day in x axis
axis(1, at=length(z),labels=weekdays(z[length(z)]+1,abbreviate=TRUE))#adds last day in x axis
axis(1, at=(length(z)/2)+1,labels=weekdays(z[length(z)/2]+1,abbreviate=TRUE))#adds mid day in x axis

dev.copy(png,file="plot4.png",width=480,heigh=480,units="px") #saves the graph in png format
dev.off() #closes device