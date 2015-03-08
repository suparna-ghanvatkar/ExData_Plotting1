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
#drawing plot
png("plot2.png")
plot(x=as.numeric(as.character(interested$Global_active_power)),type="l",ylab="Global Active Power(kilowatts)",xlab="",xaxt="n")
axis(1,at=0,labels="Thu")
axis(1,at=1500,labels="Fri")
axis(1,at=2850,labels="Sat")
dev.off()