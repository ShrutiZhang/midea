rm(list=ls())
fillname<- list.files(path="C:\\Users\\shrut\\Desktop\\美的\\数据\\日照时数","*.txt")
fillname2 <- list.files(path="C:\\Users\\shrut\\Desktop\\美的\\数据\\水气压和相对湿度数据","*.txt")

b <- data.frame(sitesnum=numeric(0),year=numeric(0),month=numeric(0),mintem=numeric(0),maxtem=numeric(0),daypercent=numeric(0),ssd=numeric(0))
for( i in 1:31){
  mydata <- read.csv(paste("C:\\Users\\shrut\\Desktop\\美的\\数据\\日照时数\\",as.character(fillname[i]),sep = ""),sep = "")
  b <- rbind(b,mydata)
}

summary(b)

names(b) <- c("sitesnum","year","month","mintep","maxtep","daypercent","ssd")
c <- as.data.frame(table(b$sitesnum))
write.csv(b,"C:\\Users\\shrut\\Desktop\\美的\\数据\\日照时数\\allsitesssd.csv")
mydatathird <- read.csv("C:\\Users\\shrut\\Desktop\\美的\\数据\\地表净辐射\\613sites水汽压和风速.csv")
cdata <- cbind(b,mydatathird)
 write.csv(cdata,"C:\\Users\\shrut\\Desktop\\美的\\数据\\地表净辐射\\613sitesmet.csv")