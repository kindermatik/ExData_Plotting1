library(data.table) #loads data.table package to be able to use fread() function
DataSet<-fread("household_power_consumption.txt",
  select=c("Date","Global_active_power")) #uploads columns required 
ReducedData<-subset(DataSet,DataSet$Date %in% c("1/2/2007","2/2/2007"))#subset the data for days chosen
plot(as.numeric(ReducedData$Global_active_power),type="l",
     ylab="Global Active Power (kilowatts)",
     xaxt = "n",xlab= "")# creates the graph

z<-as.Date(ReducedData$Date  ,format="%d/%m/%Y")#creates vector with dates for x axis

axis(1, at=1,labels=weekdays(z[1],abbreviate=TRUE))#adds first day in x axis
axis(1, at=length(z),labels=weekdays(z[length(z)]+1,abbreviate=TRUE))#adds last day in x axis
axis(1, at=(length(z)/2)+1,labels=weekdays(z[length(z)/2]+1,abbreviate=TRUE))#adds mid day in x axis

dev.copy(png,file="plot2.png",width=480,height=480,units="px") #saves the graph in png format
dev.off() #closes device
