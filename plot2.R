### Plot 2
# retrieve data from URL
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile = "./Dataset.zip")
unzip("./Dataset.zip")

# read txt file, create data table
dataFile <- "household_power_consumption.txt"
powerdt <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# filter dates
subSetData <- powerdt[powerdt$Date %in% c("1/2/2007","2/2/2007"),]
# reformat date and time
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
# reformat globalActivePower
globalActivePower <- as.numeric(subSetData$Global_active_power)

# plot line graph and export to png
png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
