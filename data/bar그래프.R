library("ggplot2")
library("scales")
#ggplot 에서 한글 테마로 만들기
library(extrafont)
theme_set(theme_gray(base_family = "NanumGothic"))

setwd('/Users/heebin/Desktop/week02') 
data <- read.csv('step.csv')

result <- data[order(-data$total_steps),]

top_user <- result[1:10,]

bar <- ggplot(top_user, aes(x=name, y=total_steps, fill=name)) + geom_bar(stat="identity") + scale_y_continuous(labels = comma)
print(bar)