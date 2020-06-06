rm(list = ls())
library(dplyr)


datayymm<- read.csv("C:\\Users\\shrut\\Desktop\\美的\\数据\\温度年月日.csv")
fillname <- matrix(datayymm$yymm,ncol = 1)


for (i in 1:length(fillname))
{  
  mydatafill <- read.csv(paste("C:\\Users\\shrut\\Desktop\\美的\\数据\\气温数据\\SURF_CLI_CHN_MUL_DAY-TEM-12001-",as.character(fillname[i]),".TXT",sep = ""),header=FALSE,sep = "")
  names(mydatafill) <- c("sites","lat","lon","alt","year","month","day","meantem","maxtem","mintem","","","")##加入列名
  mydatasub<- subset(mydatafill,mydatafill$meantem<30000,select = c(1:13))#去掉异常值
  d <- aggregate(mydatasub$meantem,list(mydatasub$sites),mean)#月均温
  b <- read.csv("C:\\Users\\shrut\\Desktop\\美的\\数据\\699sitesdata.csv")
  names(d) <- c("sitesnum","meantem")
  c <- merge(d,b,by="sitesnum",all=TRUE)#月均温度加经纬度信息
  write.csv(c,paste("C:\\Users\\shrut\\Desktop\\美的\\数据\\1961-2018月均温度\\MonMean-TEM-12001-",as.character(fillname[i]),".csv",sep = ""))
  e <- na.omit(c)
  write.csv(e,paste("C:\\Users\\shrut\\Desktop\\美的\\数据\\1961-2018月均温度\\MonMeanNA-TEM-12001-",as.character(fillname[i]),".csv",sep = ""))
}