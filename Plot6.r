source("dlData.R")
library(ggplot2)

# Load the NEI & SCC data frames.
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

png("plot6.png",width=480,height=480,units="px",bg="transparent")

sub4 <- subset(NEI, fips == "06037" & type=="ON-ROAD")
lamot.sources <- aggregate(sub4[c("Emissions")], list(type = sub4$type, year = sub4$year, zip = sub4$fips), sum)
comp.mv <- rbind(baltmot.sources, lamot.sources)
qplot(year, Emissions, data = comp.mv, color = zip, geom= "line", ylim = c(-100, 5500)) + ggtitle("Motor Vehicle Emissions in Baltimore (24510) \nvs. Los Angeles (06037) Counties") + xlab("Year") + ylab("Emission Levels") 

dev.off()
