
library(lubridate)
format(object.size(read.table("./household_power_consumption.txt",sep=";",header=T)),units="Mb")
proc_1 <- read.table("./household_power_consumption.txt",sep=";",header=T)
View(proc_v2[1:5,])
proc_1$Date <- dmy(as.character(proc_1$Date))
class(proc_1$Date)
proc_1$Time <- hms(proc_1$Time)

proc_v2 <- proc_1[proc_1$Date >= "2007-02-01" & proc_1$Date < "2007-02-03",]
proc_v2$timeStamp <- ymd_hms(paste(proc_v2$Date, proc_v2$Time))
max(proc_v2$timeStamp)
par(bg="transparent",mfrow=c(2,2))
plot(proc_v2$timeStamp,as.numeric(as.character(proc_v2$Global_active_power)),type="l",xlab="",ylab="Global Active Power")

plot(proc_v2$timeStamp,as.numeric(as.character(proc_v2$Voltage)),type="l",xlab="datetime",ylab="Voltage")

plot(proc_v2$timeStamp,as.numeric(as.character(proc_v2$Sub_metering_1)),type="n",xlab="",ylab="Energy sub metering")
points(proc_v2$timeStamp,as.numeric(as.character(proc_v2$Sub_metering_1)),type="l")
points(proc_v2$timeStamp,as.numeric(as.character(proc_v2$Sub_metering_2)),type="l",col="red")
points(proc_v2$timeStamp,as.numeric(proc_v2$Sub_metering_3),type="l",col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1)

plot(proc_v2$timeStamp,as.numeric(as.character(proc_v2$Global_reactive_power)),type="l",xlab="datetime",ylab="Global_reactive_power")


dev.copy(png,file="plot4.png")
dev.off()
