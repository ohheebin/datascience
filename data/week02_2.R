library("ggplot2")
library("scales")
#ggplot 에서 한글 테마로 만들기
library(extrafont)
theme_set(theme_gray(base_family = "NanumGothic"))

setwd('/Users/heebin/Desktop/week02')
tashu <- read.csv('tashu.csv')
tashu_station <- read.csv('station.csv')

result_station_location <- str_split_fixed(tashu_station$좌표, ",", 2)
#rent와 return의 사용빈도수 
station_route <- data.frame(table(tashu$RENT_STATION,tashu$RETURN_STATION))

names(station_route)[1] <- "rent"
names(station_route)[2] <- "return"
names(station_route)[3] <- "routeFreq"

station <- station_route[order(-station_route$routeFreq),]
result <- station[1:20,]
result_route <- result[order(result$rent),]
freq <- result_route[[3]][1:20]


point <- ggplot(data = result_route, aes(rent, return, size = routeFreq, label = routeFreq)) +
  geom_point(color = 'blue')
point + geom_point(shape=19, size=freq*0.0001259)