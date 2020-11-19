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

plot(
        power$Global_active_power ~ power$DateTime,
        type = "l",
        ylab = "Global Active Power (Kw)",
        xlab = ""
)
dev.copy(png, file = "plot2.png",width = 480, height = 480)
dev.off()
