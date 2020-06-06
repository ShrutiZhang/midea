rm(list=ls())
a <- list.files(path="C:\\Users\\shrut\\Desktop\\美的\\数据\\辐射数据\\文档任务组_20190926_1256","*.TXT")
datayymm<- read.csv("C:\\Users\\shrut\\Desktop\\美的\\数据\\温度年月日.csv")
fillname <- datayymm$yymm
for( i in 1:675){
mydata <- read.csv(paste("C:\\Users\\shrut\\Desktop\\美的\\数据\\辐射数据\\130sites辐射数据\\RADI_MUL_CHN_MON-",as.character(fillname[i]),".TXT",sep = ""),header = FALSE,sep = "")

}