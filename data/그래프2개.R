library("ggplot2")
library("scales")
library("plotly")
#ggplot 에서 한글 테마로 만들기
library(extrafont)
theme_set(theme_gray(base_family = "NanumGothic"))

setwd('/Users/heebin/Desktop/week02')
result <- read.csv('heart.csv')

#그래프 2개만드는 방법
ay <- list(tickfont = list(color = "red"), overlaying = "y", side = "right", title = "time")
p <- plot_ly() %>%
  add_bars(x = result$name, y = result$step, name="step") %>%
  add_lines(x = result$name, y = result$time, name="time", yaxis="y2")%>%
  layout(yaxis2 = ay, xaxis=list(title="name"))
print(p)