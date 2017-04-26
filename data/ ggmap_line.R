#top20의 요일과 시간을 통한 경로 보여주기
library(ggplot2)
library(ggmap)
library(stringr)
library(scales)
library(data.table)
#ggplot 에서 한글 테마로 만들기
library(extrafont)
theme_set(theme_gray(base_family = "NanumGothic"))

setwd('/Users/heebin/Desktop/week02')
tashu <- read.csv('top20_result.csv')

daejon_gc <- geocode('Daejon')
daejon_cent <- as.numeric(daejon_gc)

tashu_rent <- str_split_fixed(tashu$rent_latlon, ",", 2)
tashu_return <- str_split_fixed(tashu$return_latlon, ",", 2)
Info <- data.frame(rbind(tashu_rent, tashu_return))
Info$grp <- as.factor(rep(1:20, times = 2))

names(Info)[1] = "lat"
names(Info)[2] = "lon"
x = tashu$count

station_map <- get_googlemap(center = daejon_cent, scale = 1, zoom=13, maptype="roadmap")

#line을 만들어서 group을 이용해 선을 그어준다.
map <- ggmap(station_map) + geom_point(data=Info, aes(x=as.numeric(as.character(lon)), y=as.numeric(as.character(lat))), size=5, color='red') + 
  geom_line(data = Info, aes(x=as.numeric(as.character(lon)), y=as.numeric(as.character(lat)) , group= grp))
map

ggplot(dailyCrimes, aes(x = Hour, y = Day)) + geom_tile(aes(fill = Freq)) + scale_fill_gradient(name = 'Total Motor Vehicle Thefts', low = 'white', high = 'red') + theme(axis.title.y = element_blank())



