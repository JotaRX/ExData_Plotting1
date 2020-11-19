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
hist(power$Global_active_power,xlab = "Global Active Power (Kw)", 
     ylab="Frequency", col= "red", main = "Global Active Power",
     xlim = range(0,6),breaks = 12)
dev.copy(png, file = "plot1.png",width = 480, height = 480)
dev.off()

