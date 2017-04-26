#1월 한달간 날짜당 시간별 heatmap
library(ggplot2)
library(ggmap)
library(stringr)
library(scales)
library(data.table)
#ggplot 에서 한글 테마로 만들기
library(extrafont)
theme_set(theme_gray(base_family = "NanumGothic"))

setwd('/Users/heebin/Desktop/week02')
tashu <- read.csv('heatdata.csv')

day <- data.frame(table(tashu$week,tashu$weekday_name))
names(day)[1] = "week"
names(day)[2] = "weekday_name"

#heatmap 만드는 코드 한줄 넘길때 뒤에다 +를 써야 에러가 없다
heatmap <- ggplot(day, aes(x = week, y = weekday_name)) + geom_tile(aes(fill = Freq)) + 
  scale_fill_gradient(name = 'heatmap', low = 'white', high = 'pink') +
  scale_x_discrete(breaks = c("2", "6", "11", "15", "20", "24", "29", "33", "38", "42", "47", "51"),
                   labels = c("1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월")) +
  theme(axis.title.x = element_blank())

heatmap