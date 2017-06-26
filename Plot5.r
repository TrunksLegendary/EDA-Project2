source("dlData.R")
library(ggplot2)

# Load the NEI & SCC data frames.
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

png("plot5.png",width=480,height=480,units="px",bg="transparent")

sub3 <- subset(NEI, fips == "24510" & type=="ON-ROAD")
baltmot.sources <- aggregate(sub3[c("Emissions")], list(type = sub3$type, year = sub3$year, zip = sub3$fips), sum)
qplot(year, Emissions, data = baltmot.sources, geom= "line") + theme_gray() + ggtitle("Motor Vehicle-Related Emissions in Baltimore County") + xlab("Year") + ylab("Emission Levels")

dev.off()
