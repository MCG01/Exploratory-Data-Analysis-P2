
## PLOT 4 - Mark Gray

# Load necessary libraries
library(ggplot2)

# Load files into dataframes and merge
SummaryPM25 <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Merge the two data frames to attach short.name
SPM25SCC <- merge(SummaryPM25, SCC, by="SCC")

# Get all records that Short.Name contains coal
coalRelated  <- grepl("coal", SPM25SCC$Short.Name, ignore.case=TRUE)
subsetSPM25SCC <- SPM25SCC[coalRelated, ]

#Total Emission for coal combustion related Per Year for 1999, 2002, 2005, and 2008
yearlyTotalsCoal <- aggregate(Emissions ~ year, subsetSPM25SCC, sum)

#Create PNG file
png(file="Plot4.png", width = 640, height = 480, pointsize = 12, bg = "white")

#Create Plot
thePlot <- ggplot(yearlyTotalsCoal, aes(factor(year), Emissions))
thePlot <- thePlot + geom_bar(stat="identity") + xlab("year") + ylab(expression('Total PM'[2.5]*' Emissions')) +
  ggtitle("Total USA coal related PM 2.5 emissions from 1999 to 2008")
print(thePlot)

#Close
dev.off()