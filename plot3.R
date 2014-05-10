library(data.table) #loads data.table package to be able to use fread() function
DataSet<-fread("household_power_consumption.txt",
               select=c("Date","Sub_metering_1","Sub_metering_2","Sub_metering_3")) #uploads columns required 
ReducedData<-subset(DataSet,DataSet$Date %in% c("1/2/2007","2/2/2007"))#subset the data for days chosen
plot(as.numeric(ReducedData$Sub_metering_1),type="l",
     ylab="Energy sub metering",
     xaxt = "n",xlab= "")# creates the graph
lines(as.numeric(ReducedData$Sub_metering_2),col="red")
lines(as.numeric(ReducedData$Sub_metering_3),col="blue")


legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       cex=0.6,pch="_",col=c("black","red","blue"),
       xjust=0,adj=0) #adds the legend in th top right corner

z<-as.Date(ReducedData$Date  ,format="%d/%m/%Y")#creates vector with dates for x axis

axis(1, at=1,labels=weekdays(z[1],abbreviate=TRUE))#adds first day in x axis
axis(1, at=length(z),labels=weekdays(z[length(z)]+1,abbreviate=TRUE))#adds last day in x axis
axis(1, at=(length(z)/2)+1,labels=weekdays(z[length(z)/2]+1,abbreviate=TRUE))#adds mid day in x axis

dev.copy(png,file="plot3.png",width=550,heigh=480,units="px") #saves the graph in png format
dev.off() #closes device