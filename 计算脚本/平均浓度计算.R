
site <- read.csv("H:\\md\\画图\\allsites.csv")
setwd("H:\\md\\13-17fill\\allfill")
listfiles <- list.files(path = "H:\\md\\13-17fill\\allfill",pattern = "*.csv")
for(i in 1:length(listfiles)){
  a <- read.csv(listfiles[i])
  mydata <- merge(site,a,by=c("lon","lat"))
  attach(test)
  ##年平均
  yearmean <- aggregate(filldata,by=list(year=substr(ddd,1,4),lon=lon,lat=lat,source=source),mean)
  names(yearmean) <- c("year","lon","lat","site","mean")
  ##月平均
  ymmean <- aggregate(mydata,by=list(year=substr(datasub$date,1,7),lon=lon,lat=lat,province=province),mean)
  names(ymmean) <- c("year","lon","lat","site",",mean")
  monthmean <- aggregate(mydata,by=list(year=substr(datasub$date,6,7),lon=lon,lat=lat,province=province),mean)
  names(monthmean) <- c("year","lon","lat","site","mean")
  detach(datasub)
  write.csv(yearmean,paste("H:\\md\\画图\\yearmean\\yearmean",as.character(listfiles[i]),sep=""))
  write.csv(ymmean,paste("H:\\md\\画图\\yearmean\\ymmean",as.character(listfiles[i]),sep=""))
  
  write.csv(monthmean,paste("H:\\md\\画图\\yearmean\\monthmean",as.character(listfiles[i]),sep=""))
  
  
}


mydata <- read.csv("D:\\桌面\\美的\\污染物平均浓度\\PRD\\yearmeanallo3.csv")
for(i in 2013:2018){
  mydatasub <- subset(mydata,year==i)
  write.csv(mydatasub,paste("D:\\桌面\\美的\\污染物平均浓度\\o3yearmean",i,".csv",sep=""))
  }