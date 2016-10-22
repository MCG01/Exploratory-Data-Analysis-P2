## PLOT 1 - Mark Gray
SummaryPM25 <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
#Total Emission Per Year for 1999, 2002, 2005, and 2008
yearlyTotals <- aggregate(Emissions ~ year, SummaryPM25, sum)
#Create PNG file
png(file="Plot1.png", width = 640, height = 480, pointsize = 12, bg = "white")
#Create Plot
barplot(height=yearlyTotals$Emissions, names.arg=yearlyTotals$year, xlab="years", ylab=expression('total PM'[2.5]*' emission'),main=expression('Total PM'[2.5]*' emissions at various years'))
#Close
dev.off()