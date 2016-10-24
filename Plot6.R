
## PLOT 6 - Mark Gray

# Load necessary libraries
library(ggplot2)

# Load files into dataframes and merge
SummaryPM25 <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Merge the two data frames 
SPM25SCC <- merge(SummaryPM25, SCC, by="SCC")

# Total On-Road Emission for Baltimore City and LA Per Year for 1999, 2002, 2005, and 2008
subsetSPM25SCC <- SPM25SCC[(SPM25SCC$fips == "24510"|SPM25SCC$fips == "06037") & SPM25SCC$type == "ON-ROAD",]
yearlyTotals <- aggregate(Emissions ~ year + fips, subsetSPM25SCC, sum)

# Replace location codes with readable names.
yearlyTotals$fips[yearlyTotals$fips=="24510"] <- "Baltimore, MD"
yearlyTotals$fips[yearlyTotals$fips=="06037"] <- "Los Angeles, CA"

# Create the bar plot and colour for visual impact
png("Plot6.png", width=1040, height=480)
g <- ggplot(yearlyTotals, aes(x=factor(year), y=Emissions, fill=fips))
g <- g + geom_bar(stat="identity", position=position_dodge(), colour="Black")  +
  scale_fill_manual(values=c("#12135a", "#4682b4"),name="Cities") + # Colours bars & labels the legend
  xlab("year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions from motor vehicle in Baltimore City and Los Angeles from 1999 to 2008')
print(g)

# Close
dev.off()