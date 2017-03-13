


# Adding lubridate library to play with date
library(lubridate)

# To estimate the memory required by the dataset
format(object.size(read.table("./household_power_consumption.txt",sep=";",header=T)),units="Mb")

# Importing electrical power consumption

base_file_v1 <- read.table("./household_power_consumption.txt",sep=";",header=T)

base_file_v1$Date <- dmy(as.character(base_file_v1$Date))
class(base_file_v1$Time)
base_file_v1$Time <- hms(as.character(base_file_v1$Time))

base_file_v2 <- base_file_v1[base_file_v1$Date >= "2007-02-01" & base_file_v1$Date < "2007-02-03",]
base_file_v2$timeStamp <- ymd_hms(paste(base_file_v2$Date, base_file_v2$Time))

#Constructing the required plot
par(bg="transparent")
plot(base_file_v2$timeStamp,as.numeric(as.character(base_file_v2$Global_active_power)),type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.copy(png,file="plot2.png",height=480,width=480)
dev.off()

