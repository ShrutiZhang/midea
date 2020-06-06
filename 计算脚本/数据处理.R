library(dplyr)
a <- read.csv("D:\\桌面\\美的\\污染物13-18\\2018data\\2018co.csv")
head(a)
b <- arrange(a,a$lon,a$lat) 
head(b)             
mystation <- unique(b[c(1,2)]) ##站点排列
##建立时间序列
temp <- seq.POSIXt(from = as.POSIXct("2018-01-01 00:00:00"), to = as.POSIXct("2018-12-31 23:00:00"), by = 'hour')
mydate <- data.frame(temp)
names(mydate) <- c("c")
head(mydate)
tail(mydate)


timeline <- merge(mydate,mystation)
names(timeline) <- c("datetime","lon","lat")



c <- as.POSIXct(b$datetime,origin="2018/01/01 00:00:00")#时间转化
subc <- data.frame(c)
mydata <- cbind(b,subc)



#时间和数据拼接
mm <- merge(timeline,mydata,by=c("c","lon","lat"),all=TRUE)
d<- merge(mm,mydate,by="c",all=T)
ddd <- arrange(d,lon,lat)
which(is.na(d))

#线性插值

