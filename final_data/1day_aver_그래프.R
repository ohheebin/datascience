
library("ggplot2")
library("scales")
#ggplot 에서 한글 테마로 만들기
library(extrafont)
theme_set(theme_gray(base_family = "NanumGothic"))

setwd('/Users/heebin/Desktop/DS') 
data <- read.csv('heatdata.csv')

bar <- ggplot(data, aes(x=name, y=aver, fill=name)) + geom_bar(stat="identity") + scale_y_continuous(labels = comma)
print(bar)