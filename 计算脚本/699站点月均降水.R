rm(list = ls())
library(dplyr)


  datayymm<- read.csv("C:\\Users\\shrut\\Desktop\\美的\\数据\\温度年月日.csv")
  fillname <- matrix(datayymm$yymm,ncol = 1)

  
  for (i in 1:length(fillname))
  {  
    mydatafill <- read.csv(paste("C:\\Users\\shrut\\Desktop\\美的\\数据\\降水与风向风速数据\\SURF_CLI_CHN_MUL_DAY-PRE-13011-",as.character(fillname[i]),".TXT",sep = ""),header=FALSE,sep = "")
    names(mydatafill) <- c("sitesnum","lat","lon","alt","year","month","day","v8","v9","pre","","","")##加入列名
    mydatasub<- subset(mydatafill,mydatafill$pre<30000,select = c(1:13))#去掉异常值
    d <- aggregate(mydatasub$pre,list(mydatasub$sites),sum)#月均温
    b <- read.csv("C:\\Users\\shrut\\Desktop\\美的\\数据\\699sitesdata.csv")
    names(d) <- c("sitesnum","meanpre")
    c <- merge(d,b,by="sitesnum",all=TRUE)#月均温度加经纬度信息
    write.csv(c,paste("C:\\Users\\shrut\\Desktop\\美的\\数据\\1961-2018月均降水\\MonMean-PRE-13011-",as.character(fillname[i]),".csv",sep = ""))
    e <- na.omit(c)
    write.csv(e,paste("C:\\Users\\shrut\\Desktop\\美的\\数据\\1961-2018月均降水\\MonMeanNA-PRE-13011-",as.character(fillname[i]),".csv",sep=""))
  
}