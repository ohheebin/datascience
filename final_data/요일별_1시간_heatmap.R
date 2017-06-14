#1월 한달간 날짜당 시간별 heatmap
library(ggplot2)
library(ggmap)
library(stringr)
library(scales)
library(data.table)
#ggplot 에서 한글 테마로 만들기
library(extrafont)
theme_set(theme_gray(base_family = "NanumGothic"))

setwd('/Users/heebin/Desktop/DS')
tashu <- read.csv('heatmap_day.csv')

day <- data.frame(table(tashu$hour,tashu$step,tashu$weekday))
names(day)[1] = "week"
names(day)[2] = "weekday_name"

#heatmap 만드는 코드 한줄 넘길때 뒤에다 +를 써야 에러가 없다
heatmap <- ggplot(tashu, aes(x = hour, y = weekday)) + geom_tile(aes(fill = step)) + 
  scale_fill_gradient(name = 'step', low = 'white', high = 'pink', labels = comma) +
  theme(axis.title.x = element_blank())

heatmap