# read all the power consumption data into memory
data <- read.table("household_power_consumption.txt",sep=";",header=TRUE)

# subsetting the power consumption data between 2007-02-01 and 2007-02-02
power_consumption <- data[(as.character(data$Date)=="1/2/2007")|(as.character(data$Date)=="2/2/2007"),]
rm("data")

# subsetting data for plot
fig_data <- power_consumption[7:9]
for(i in 1:ncol(fig_data)){
  fig_data[[i]] <- as.numeric(as.character(fig_data[[i]]))
}
rm("i")

# make hist plot and save plot into png file
png(filename="plot3.png",bg="white",width=480,height=480,units="px")
plot(fig_data[[1]],type="l",col="black",axes=FALSE,ann=FALSE)
lines(fig_data[[2]],col="red")
lines(fig_data[[3]],col="blue")

# make x axis with Thu-Sat labels
axis(side=1,at=seq(1,nrow(power_consumption),length=3),
     lab=c(weekdays(as.Date("2007/02/01"),abbreviate=3),
           weekdays(as.Date("2007/02/02"),abbreviate=3),
           weekdays(as.Date("2007/02/03"),abbreviate=3)))

# make y axis with horizontal labels
axis(side=2)

# create box arround plot and add y labels
box()
title(ylab="Energy sub metering")

# make legend
legend(x="topright",names(fig_data),lty=1,col=c("black","red","blue"))

dev.off()
rm("fig_data")