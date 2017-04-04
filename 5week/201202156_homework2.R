library("ggplot2")
library("scales")
library("plotly")
setwd('C:/Users/heebin/Documents/R/fitbit') 
result <- read.csv('heart.csv')
ay <- list(tickfont = list(color = "red"), overlaying = "y", side = "right", title = "time")
p <- plot_ly() %>%
  add_bars(x = result$name, y = result$step, name="step") %>%
  add_lines(x = result$name, y = result$time, name="time", yaxis="y2")%>%
  layout(yaxis2 = ay, xaxis=list(title="name"))
print(p)

