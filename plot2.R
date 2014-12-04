# read all the power consumption data into memory
data <- read.table("household_power_consumption.txt",sep=";",header=TRUE)

# subsetting the power consumption data between 2007-02-01 and 2007-02-02
power_consumption <- data[(as.character(data$Date)=="1/2/2007")|(as.character(data$Date)=="2/2/2007"),]
rm("data")

# make hist plot and save plot into png file
png(filename="plot2.png",bg="white",width=480,height=480,units="px")
plot(as.numeric(as.character(power_consumption$Global_active_power)),type="l",
     ylab="Global Active Power (kilowatts)",axes=FALSE,ann=FALSE)

# make x axis with Thu-Sat lables
axis(side=1,at=seq(1,nrow(power_consumption),length=3),
     lab=c(weekdays(as.Date("2007/02/01"),abbreviate=3),
           weekdays(as.Date("2007/02/02"),abbreviate=3),
           weekdays(as.Date("2007/02/03"),abbreviate=3)))

# make y axis with horizontal labels
axis(side=2)

# create box arround plot and add y labels
box()
title(ylab="Global Active Power (kilowatts)")

dev.off()