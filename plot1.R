#getting the data
temp <- tempfile()
download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
data <- read.csv2(unz(temp, "household_power_consumption.txt"))
unlink(temp)
#extracting the interested data
data$Date<-as.Date(data$Date,"%d/%m/%Y")
feb1<-subset(data,data$Date=="2007-02-01")
feb2<-subset(data,data$Date=="2007-02-02")
interested<-rbind(feb1,feb2)
#draw the plot
png("plot1.png")
hist(as.numeric(as.character(interested$Global_active_power)),col="red",xlab="Global Active Power(kilowatts)",main="Golbal Active Power")
dev.off()