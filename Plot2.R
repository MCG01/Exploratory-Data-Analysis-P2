## PLOT 2 - Mark Gray
SummaryPM25 <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
#Total Emission for Baltimore City, Maryland Per Year for 1999, 2002, 2005, and 2008
subSetMaryland <- SummaryPM25[SummaryPM25$fips== "24510",]
yearlyTotals <- aggregate(Emissions ~ year, subSetMaryland, sum)
#Create PNG file
png(file="Plot2.png", width = 640, height = 480, pointsize = 12, bg = "white")
#Create Plot
barplot(height=yearlyTotals$Emissions, names.arg=yearlyTotals$year, xlab="years", ylab=expression('total PM'[2.5]*' emission'),main=expression('Total PM'[2.5]*' emissions at various years in Baltimore City, Maryland'))
#Close
dev.off()