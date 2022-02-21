### Plot 4
library(dplyr)
# retrieve data from URL
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile = "./Dataset.zip")
unzip("./Dataset.zip")

# read txt file, create data table
dataFile <- "household_power_consumption.txt"
powerdt <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
# filter dates
subSetData <- powerdt[powerdt$Date %in% c("1/2/2007","2/2/2007") ,]

# reformat date and time
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
# reformat globalActivePower to SubMetering 3
subSetData_num <- tbl_df(sapply(select(subSetData, c(Global_active_power:Sub_metering_3)),
                                as.numeric))

# subplots and export to png
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2))
# plot top left
plot(datetime, subSetData_num$Global_active_power, type="l", xlab="", ylab="Global Active Power", cex=0.2)
# plot top right
plot(datetime, subSetData_num$Voltage, type="l", xlab="datetime", ylab="Voltage")
# plot bottom left
plot(datetime, subSetData_num$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subSetData_num$Sub_metering_2, type="l", col="red")
lines(datetime, subSetData_num$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
# plot bottom right
plot(datetime, subSetData_num$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()