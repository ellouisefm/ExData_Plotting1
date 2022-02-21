### Plot 1
# retrieve data from URL
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile = "./Dataset.zip")
unzip("./Dataset.zip")

# read txt file, create data table
dataFile <- "household_power_consumption.txt"
powerdt <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# filter dates
subSetData <- powerdt[data$Date %in% c("1/2/2007","2/2/2007") ,]
# reformat globalActivePower
globalActivePower <- as.numeric(subSetData$Global_active_power)

# plot histogram and export to png
png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()