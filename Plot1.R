
## PLOT 1 - Mark Gray

# Load files into dataframes
SummaryPM25 <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Total Emission Per Year for 1999, 2002, 2005, and 2008
yearlyTotals <- aggregate(Emissions ~ year, SummaryPM25, sum)

# Create PNG file
png(file="Plot1.png", width = 640, height = 480, pointsize = 12, bg = "white")

# Create Plot
opt <- options(scipen = 10) # Makes the axis labels show as whole numbers instead of scientific notation
barplot(height=yearlyTotals$Emissions, names.arg=yearlyTotals$year, xlab="years", ylab=expression('total PM'[2.5]*' emission'),main=expression('Total USA PM'[2.5]*' emissions from 1999 to 2008'))
options(opt)

# Close
dev.off()