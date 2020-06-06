
library(dplyr)
temfile <- list.files(path = "D:\\桌面\\美的\\数据\\1961-2018月均温度",pattern="*csv")
setwd("D:\\桌面\\美的\\数据\\1961-2018月均温度")
aidata <- read.csv("D:\\桌面\\美的\\数据\\地表净辐射\\613sitesETdata.csv")

subaidata <- aidata[c("sitesnum","year","month","台站名称","省份","纬度","经度","daypre","monthET","AI")]

firstdata <- data.frame()
for(i in 1:length(temfile)){
mydata <- read.csv(temfile[i])
year <- as.numeric(substring(temfile[i],21,24))
month <- as.numeric(substring(temfile[i],25,26))
thedate <- cbind(year,month)
mytemdata <- merge(thedate,mydata)
subtem <- mytemdata[c("year","month","sitesnum","meantem")]
firstdata <- rbind(firstdata,subtem)
}
datafinal <- merge(firstdata,subaidata)
#write.csv(datafinal,"D:\\桌面\\美的\\数据\\画图专用\\58yearmonthmean.csv")
