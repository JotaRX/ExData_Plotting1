#open the file
setwd("C://Dropbox//Educación Complementaria//DataScientists//Exploratory Data Analysis//Proyecto 1")
power<-read.table(
        "./household_power_consumption.txt",
        header = T,
        sep = ";",
        na.strings = "?"
)
power$Date<-as.Date(power$Date, format = "%d/%m/%Y")
power<-power[power$Date == as.Date("1/2/2007","%d/%m/%Y") |
                     power$Date == as.Date("2/2/2007","%d/%m/%Y") ,]
power$DateTime<- as.POSIXct(paste(power$Date,power$Time))

with({plot(
        power$Sub_metering_1 ~ power$DateTime,
        type = "l",
        ylab = "Energy sub metering",
        xlab = "")
        lines(   power$Sub_metering_2 ~ power$DateTime,
                 type = "l",col="red")
        lines(   power$Sub_metering_3 ~ power$DateTime,
                 type = "l",col="blue")
        })
legend("topright", col=c("black", "red", "blue"), lwd=c(1,1,1), 
       c("Sub metering 1", "Sub metering 2", "Sub_metering 3"))
dev.copy(png, file = "plot3.png",width = 480, height = 480)
dev.off()
