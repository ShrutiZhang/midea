###58年总气候图
rm(list=ls())
a <- read.csv("C:\\Users\\shrut\\Desktop\\美的\\数据\\画图专用\\mydata1960s.csv")
b <- read.csv("C:\\Users\\shrut\\Desktop\\美的\\数据\\画图专用\\mydata1970s.csv")
c <- read.csv("C:\\Users\\shrut\\Desktop\\美的\\数据\\画图专用\\mydata1980s.csv")
d <- read.csv("C:\\Users\\shrut\\Desktop\\美的\\数据\\画图专用\\mydata1990s.csv")
e <- read.csv("C:\\Users\\shrut\\Desktop\\美的\\数据\\画图专用\\mydata2000s.csv")
f <- read.csv("C:\\Users\\shrut\\Desktop\\美的\\数据\\画图专用\\mydata2010s.csv")
x <- read.csv("C:\\Users\\shrut\\Desktop\\美的\\数据\\地表净辐射\\613sites.csv")
alldata <- rbind(a,b,c,d,e,f)

y <- aggregate(alldata[c("jiwendays","meanJantem","meanJulytem","meanpre","meanet","AI")],list(alldata$sitesnum),FUN=mean,simplify = TRUE)

mydata <- merge(y,x,by.y="sitesnum",by.x="Group.1")
write.csv(mydata,"C:\\Users\\shrut\\Desktop\\美的\\数据\\画图专用\\58yearsdata.csv")