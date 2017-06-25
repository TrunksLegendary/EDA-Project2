### --- Download Data and Extract to a Directory --- ###
dlData<-function()
{
  dataFile <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip'
  download.file(dataFile, 'EPS-Data.zip', method='curl')
  unzip('EPS-Data.zip')
  
}
if (!file.exists("EPS-Data.zip")) {
  dlData()
}
### --- Download Data and Extract to a Directory --- ###