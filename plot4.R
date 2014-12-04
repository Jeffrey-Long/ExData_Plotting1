# read all the power consumption data into memory
data <- read.table("household_power_consumption.txt",sep=";",header=TRUE)

# subsetting the power consumption data between 2007-02-01 and 2007-02-02
power_consumption <- data[(as.character(data$Date)=="1/2/2007")|(as.character(data$Date)=="2/2/2007"),]
rm("data")

# make hist plot and save plot into png file
png(filename="plot4.png",bg="white",width=480,height=480,units="px")

# make 2-row and 2-column pannels plot
par(mfcol = c(2,2))
# pannel row 1 and column 1 for Global Active Power plot
plot(as.numeric(as.character(power_consumption$Global_active_power)),
     type="l",axes=FALSE,ann=FALSE)
axis(side=1,at=seq(1,nrow(power_consumption),length=3),
     lab=c(weekdays(as.Date("2007-02-01"),abbreviate=3),
           weekdays(as.Date("2007-02-02"),abbreviate=3),
           weekdays(as.Date("2007-02-03"),abbreviate=3)))
axis(side=2)
box()
title(ylab="Global Active Power")

# pannel row 2 and column 1 for Energy sub metering plot
# subsetting data for energy sub metering plot
fig_data <- power_consumption[7:9]
plot(as.numeric(as.character(fig_data$Sub_metering_1)),
     type="l",col="black",axes=FALSE,ann=FALSE)
lines(as.numeric(as.character(fig_data$Sub_metering_2)),
      col="red")
lines(as.numeric(as.character(fig_data$Sub_metering_3)),
      col="blue")
axis(side=1,at=seq(1,nrow(power_consumption),length=3),
     lab=c(weekdays(as.Date("2007-02-01"),abbreviate=3),
           weekdays(as.Date("2007-02-02"),abbreviate=3),
           weekdays(as.Date("2007-02-03"),abbreviate=3)))
axis(side=2)
title(ylab="Energy sub metering")
legend(x="topright",names(fig_data),col=c("black","red","blue"),
       lty=1,text.font=.5,box.lty=0)
box()
rm("fig_data")

# pannel row 1 and column 2 for Voltage plot
plot(as.numeric(as.character(power_consumption$Voltage)),
     type="l",axes=FALSE,ann=FALSE)
axis(side=1,at=seq(1,nrow(power_consumption),length=3),
     lab=c(weekdays(as.Date("2007-02-01"),abbreviate=3),
           weekdays(as.Date("2007-02-02"),abbreviate=3),
           weekdays(as.Date("2007-02-03"),abbreviate=3)))
axis(side=2)
box()
title(ylab="Voltage",xlab="datetime")

# pannel row 2 and column 2 for Global_reactive_power plot
plot(as.numeric(as.character(power_consumption$Global_reactive_power)),
     type="l",axes=FALSE,ann=FALSE)
axis(side=1,at=seq(1,nrow(power_consumption),length=3),
     lab=c(weekdays(as.Date("2007-02-01"),abbreviate=3),
           weekdays(as.Date("2007-02-02"),abbreviate=3),
           weekdays(as.Date("2007-02-03"),abbreviate=3)))
axis(side=2)
box()
title(ylab="Global_reactive_power",xlab="datetime")

dev.off()