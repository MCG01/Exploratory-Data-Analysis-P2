## PLOT 3 - Mark Gray
library(ggplot2)
SummaryPM25 <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
#Total Emission for Baltimore City, Maryland Per Year for 1999, 2002, 2005, and 2008
subSetMaryland <- SummaryPM25[SummaryPM25$fips == "24510",]
yearlyTotalsbyType <- aggregate(Emissions ~ year + type, subSetMaryland, sum)
#Create PNG file
png(file="Plot3.png", width = 640, height = 480, pointsize = 12, bg = "white")
#Create Plot
thePlot <- ggplot(yearlyTotalsbyType, aes(year, Emissions, color = type))
thePlot <- thePlot + geom_line() + xlab("year") + ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle("Total PM [2.5]* emissions at various years in Baltimore City, Maryland by type")
print(thePlot)

#Close
dev.off()