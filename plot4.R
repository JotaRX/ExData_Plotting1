#open the file
setwd("C://Dropbox//Educación Complementaria//DataScientists//Exploratory Data Analysis//Proyecto 1")
power<-read.table(
        "./household_power_consumption.txt",
        header = T,
        sep = ";",
        na.strings = "?"
)
power$Date<-as.Date(power$Date, format = "%d/%m/%Y")
power<-power[power$Date == as.Date("1/7/2007","%d/%m/%Y") |
                     power$Date == as.Date("2/7/2007","%d/%m/%Y") ,]
power$DateTime<- as.POSIXct(paste(power$Date,power$Time))
power <- power[complete.cases(power),]

par(mfrow=c(2,2), mar=c(4,4,4,4))
with({
        plot(power$Global_active_power~power$DateTime, type="l", 
             ylab="Global Active Power (Kw)", xlab="")
        plot(power$Voltage~power$DateTime, type="l", 
             ylab="Voltage (volt)", xlab="")
        plot(
                power$Sub_metering_1 ~ power$DateTime,
                type = "l",
                ylab = "Energy sub metering",
                xlab = "")
        lines(   power$Sub_metering_2 ~ power$DateTime,
                 type = "l",col="red")
        lines(   power$Sub_metering_3 ~ power$DateTime,
                 type = "l",col="blue")
        legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
               legend=c("Sub metering 1", "Sub metering 2", "Sub metering 3"))
        plot(power$Global_reactive_power~power$DateTime, type="l", 
             ylab="Global Rective Power (Kw)",xlab="")
})

dev.copy(png, file = "plot4.png",width = 480, height = 480)
dev.off()
