library(dplyr)
rm(list=ls())

year <- matrix(2011:2018,ncol=1)

a <- data.frame(sitesnum=numeric(0),meanJantem=numeric(0))
for(i in 1:8){
mydata <- read.csv(paste("C:\\Users\\shrut\\Desktop\\美的\\数据\\气温数据\\SURF_CLI_CHN_MUL_DAY-TEM-12001-",as.character(year[i]),"07.TXT",sep=""),header=FALSE,sep="")
b <- aggregate(mydata$V8,list(mydata$V1),FUN=mean)#每一年的1月平均气温
c <- rbind(a,b)#10年拼接
}
names(c) <- c("sitesnum","meanJantem")
decadetem <- aggregate(meanJantem~sitesnum,c,FUN = mean)##计算10年的7月平均气温
sites<- read.csv("C:\\Users\\shrut\\Desktop\\美的\\数据\\699sitesdata.csv")
d<- merge(decadetem,sites,by="sitesnum",all=TRUE)#加上经纬度信息
write.csv(d,"C:\\Users\\shrut\\Desktop\\美的\\数据\\用于划气候带\\Julymeantemp-2010s.csv")
e <- na.omit(d)
write.csv(e,"C:\\Users\\shrut\\Desktop\\美的\\数据\\用于划气候带\\JulymeantempNA-2010s.csv")
