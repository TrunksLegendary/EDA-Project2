source("dlData.R")
library(ggplot2)

# Load the NEI & SCC data frames.
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

png("plot3.png",width=480,height=480,units="px",bg="transparent")

sub2 <- subset(NEI, fips == "24510")
balt.sources <- aggregate(sub2[c("Emissions")], list(type = sub2$type, year = sub2$year), sum)
qplot(year, Emissions, data = balt.sources, color = type, geom= "line")+ ggtitle("Total PM2.5 Emissions in Baltimore County by Source Type") + xlab("Year") + ylab("PM2.5 Emissions") 

dev.off()