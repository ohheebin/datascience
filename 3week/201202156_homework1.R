library("ggplot2")
library("scales")
library("ggmap")
library("stringr")
library("hexbin")

setwd('C:/Users/heebin/Documents/R/tashu') 
tashu <- read.csv('tashu.csv')
tashu_station <- read.csv('station.csv')

daejon_gc <- geocode('Daejon')
daejon_cent <- as.numeric(daejon_gc)

station <- data.frame(table(tashu$RENT_STATION))
return_station <- data.frame(table(tashu$RENT_STATION))

station_location <- data.frame(table(tashu_station))
result_station_location <- str_split_fixed(tashu_station$ÁÂÇ¥, ",", 2)
Info <- cbind(tashu_station,result_station_location)
names(Info)[9] = "lat"
names(Info)[10] = "lon"

x <- station[[2]][1:144] + return_station[[2]][1:144]
station[[2]][1:144] <- x[1:144]
station2 <- station[order(-station$Freq),]
result <- station2[1:10,]
result_station <- result[order(result$Var1),]
names(result_station)[1] <- "station"

bar <- ggplot(result_station, aes(x=station, y=Freq, fill=station)) + geom_bar(stat="identity") + scale_y_continuous(labels = comma)
bar

station_map <- get_googlemap(center = daejon_cent, scale = 1, zoom=13, maptype="roadmap")
map <- ggmap(station_map) + geom_point(data=Info, aes(x=as.numeric(as.character(lon)), y=as.numeric(as.character(lat))),size=x*0.0000248,colour='red')
map

