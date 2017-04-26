#1달간 step heatmap
library(ggplot2)
library(ggmap)
library(stringr)
library(scales)
library(data.table)
#ggplot 에서 한글 테마로 만들기
library(extrafont)
theme_set(theme_gray(base_family = "NanumGothic"))

setwd('/Users/heebin/Desktop/python-fitbit-master')
data <- read.csv('result_step.csv')
data2 <- read.csv('result_step_15min.csv')
sleep <- read.csv('result_sleep.csv')

#heatmap 만드는 코드 한줄 넘길때 뒤에다 +를 써야 에러가 없다
heatmap <- ggplot(data, aes(x = as.character(weekday), y = week)) + geom_tile(aes(fill = total_steps)) + 
  scale_fill_gradient(name = 'heatmap', low = 'white', high = 'pink') +
  scale_x_discrete(breaks = c("0", "1", "2", "3", "4", "5", "6"),
                   labels = c("mon","tue","wed","thu","fri","sat","sun")) +
  theme(axis.title.x = element_blank())

heatmap

#heatmap 만드는 코드 한줄 넘길때 뒤에다 +를 써야 에러가 없다
heatmap <- ggplot(data2, aes(x = as.numeric(as.character(HM)), y = as.character(weekday))) + geom_tile(aes(fill = steps)) + 
  scale_fill_gradient(name = 'heatmap', low = 'white', high = 'pink') +
  scale_y_discrete(breaks = c("0", "1", "2", "3", "4", "5", "6"),
                   labels = c("mon","tue","wed","thu","fri","sat","sun"), position="left") +
  xlab('15 minute') + ylab(NULL)

heatmap

#sleep에 대한 heatmap
heatmap <- ggplot(sleep, aes(x = as.character(weekday), y = week)) + geom_tile(aes(fill = sleep)) + 
  scale_fill_gradient(name = 'heatmap', low = 'white', high = 'pink') +
  scale_x_discrete(breaks = c("0", "1", "2", "3", "4", "5", "6"),
                   labels = c("mon","tue","wed","thu","fri","sat","sun")) +
  theme(axis.title.x = element_blank())

heatmap
