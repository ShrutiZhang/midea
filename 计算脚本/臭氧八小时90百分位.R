library(plyr)
library(ggplot2)

mydata <- read.csv("D:\\桌面\\美的\\o3_fill.csv")
#MAD8
#rollm <- ddply(mydatafill,c("year","month","day"),transform,rm8h=rollmean(O3,8,align="right",na.pad=TRUE))
#max8h <- mydatafill%>%group_by(year,month,day)%>%summarise(max8h=max(rm8h,na.rm=T))#对所求得的移动均值求最大值赋值给max8h
#x<-c(0,10, 20, 30, 40, 50,60,80,80,90)
#y <- quantile(x,probs = (0.9),na.rm = FALSE)



myfun <- function(x,y){
  quantile(x,probs = (0.9),na.rm = FALSE)
}
head(mydata)
yearmean <- ddply(mydata,.(lon,lat,year=substr(date,1,4)),summarise,year90=myfun(p90))
ymmean <- ddply(mydata,.(lon,lat,year=substr(date,1,7)),summarise,mean90=mean(p90),meanma=mean(ma))
monthmean <- ddply(mydata,.(lon,lat,year=substr(date,6,7)),summarise,mean90=mean(p90),meanma=mean(ma))

write.csv(yearmean,"D:\\桌面\\美的\\污染物平均浓度\\臭氧八小时平均\\O3yearp90mean.csv")
write.csv(ymmean,"D:\\桌面\\美的\\污染物平均浓度\\臭氧八小时平均\\O3ymmean.csv")
write.csv(monthmean,"D:\\桌面\\美的\\污染物平均浓度\\臭氧八小时平均\\O3ymonthmean.csv")
##筛选站点
site <- read.csv("D:\\桌面\\美的\\污染物平均浓度\\全部站点数据.csv")
mydatasite <- merge(site,yearmean,by=c("lon","lat"))

write.csv(mydatasite,"D:\\桌面\\美的\\污染物平均浓度\\臭氧八小时平均\\O3sitemean.csv")

