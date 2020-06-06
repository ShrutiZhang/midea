 
rm()
station <- read.csv("C:\\Users\\shrut\\Desktop\\美的\\公开\\_数据说明(1)\\isd-history.csv")
ch <- [station$CTRY=="CH",station$CTRY=="TW",station$CTRY=="HK",station$CTRY=="MC")
ch <- station[station$CTRY=="CH",]
tw <- station[station$CTRY=="TW",]
hk<- station[station$CTRY=="HK",]
mc <- station[station$CTRY=="MC",]
chinasta <- rbind(ch,tw,hk,mc)
head(chinasta)
write.csv(chinasta,"C:\\Users\\shrut\\Desktop\\美的\\公开\\_数据说明(1)\\china-history.csv")
test <- station[station$CTRY=="CH"&"TW",]
##