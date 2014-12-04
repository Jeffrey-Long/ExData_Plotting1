# read all the power consumption data into memory
data <- read.table("household_power_consumption.txt",sep=";",header=TRUE)

# subsetting the power consumption data between 2007-02-01 and 2007-02-02
power_consumption <- data[(as.character(data$Date)=="1/2/2007")|(as.character(data$Date)=="2/2/2007"),]
rm("data")

# make hist plot and save plot into png file
png(filename="plot1.png",bg="white",width=480,height=480,units="px")
hist(as.numeric(as.character(power_consumption$Global_active_power)),col="red",xlab="Global Active Power (kilowatts)",
     main="Global Active Power")
dev.off()