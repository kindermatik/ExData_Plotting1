library(data.table) #loads data.table package to be able to use fread() function
DataSet<-fread("household_power_consumption.txt",select=c("Date","Global_active_power")) #uploads columns required 
ReducedData<-subset(DataSet,DataSet$Date %in% c("1/2/2007","2/2/2007"))#subset the data for days chosen
hist(as.numeric(ReducedData$Global_active_power),main="Global Active Power"
     ,xlab="Global Active Power (kilowatts)",col="red")# creates the histogram
dev.copy(png,file="plot1.png",width=480,height=480,units="px") #saves the graph in png format
dev.off() #closes device