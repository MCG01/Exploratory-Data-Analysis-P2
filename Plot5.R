
## PLOT 5 - Mark Gray

# Load necessary libraries
library(ggplot2)

# Load files into dataframes and merge
SummaryPM25 <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Total Emission for Baltimore City, Maryland Per Year for 1999, 2002, 2005, and 2008
subSetMarylRoad <- SummaryPM25[SummaryPM25$fips=="24510" & SummaryPM25$type=="ON-ROAD",  ]
yearlyTotals <- aggregate(Emissions ~ year, subSetMarylRoad, sum)

# Replace location codes with readable names.
yearlyTotals$fips[yearlyTotals$fips=="24510"] <- "Baltimore, MD"

#Create PNG file
png(file="Plot5.png", width = 640, height = 480, pointsize = 12, bg = "white")

#Create Plot
thePlot <- ggplot(yearlyTotals, aes(factor(year), Emissions))
thePlot <- thePlot + geom_bar(stat="identity") + 
  xlab("year") + 
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle("Total PM 2.5 Emissions from motor vehicles in Baltimore City, Maryland from 1999 to 2008")
print(thePlot)

#Close
dev.off()