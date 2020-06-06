
library(dplyr)
rm(list=ls())
temfile <- list.files(path = "D:\\桌面\\美的\\数据\\日集气温数据",pattern="*TXT")
setwd("D:\\桌面\\美的\\数据\\日集气温数据")
View(temfile)

##year <- matrix(1961:2018,ncol=1)
datafull <- data.frame()

for(i in 1:length(temfile)){
  mydata <- read.csv(temfile[i],header=FALSE,sep="")
  names(mydata) <- c("sites","lat","lon","alt","year","month","day","meantem","maxtem","mintem","V1","V2","V3")
  mydata[mydata==32766] <- NA
  datafull <- rbind(datafull,mydata)
}
head(datafull)
mydatasub <- datafull[,1:8]
a <- na.omit(mydatasub)
yearmean <- aggregate(a$meantem,by=list(a$year),mean)
tepmean <- cbind(yearmean$Group.1,as.data.frame(yearmean$x*0.1))
names(tepmean) <- c("year","Mean")
write.csv(tepmean,"D:\\桌面\\美的\\数据\\全国平均气温.csv")
library(ggplot2)
attach(tepmean)
ggplot(tepmean,aes(year,Mean))+
  geom_line(size=1)+labs()+
  geom_point(colour="red",size=3)+
  labs(title="1961-2018全国平均气温变化折线图",x="年份",y="平均气温(℃)")+
  theme(plot.title = element_text(hjust = 0.5,size = 19),axis.title.x=element_text(size=16),axis.title.y=element_text(size=16))+
  scale_x_continuous(breaks=seq(1960,2020,5))+theme_bw()+ theme(panel.border = element_blank(),panel.grid.major = element_blank(),panel.grid.minor = element_blank(),axis.line = element_line(colour = "black"))

  
                                                                 
  tepmean <- read.csv("D:\\桌面\\美的\\数据\\yearmaintep.csv")


library(Cairo)
pdf("D:\\桌面\\美的\\数据\\温度带图\\新建文件夹\\testplot.pdf",family = "GB1")
ggplot(tepmean,aes(year,Mean))+
  geom_line(size=1)+labs()+
  geom_point(colour="red",size=3)+
  labs(title="1961-2018全国平均气温变化折线图",x="年份",y="平均气温(℃)")+
  theme(plot.title = element_text(hjust = 0.5,size = 19),axis.title.x=element_text(size=16),axis.title.y=element_text(size=16))+
  scale_x_continuous(breaks=seq(1960,2020,5))+theme_bw()+ theme(panel.border = element_blank(),panel.grid.major = element_blank(),panel.grid.minor = element_blank(),axis.line = element_line(colour = "black"))


dev.off()