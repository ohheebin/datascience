library("ggplot2")
library("scales")

setwd('C:/Users/heebin/Documents/R/fitbit') 
data <- read.csv('step.csv')

result <- data[order(-data$total_steps),]

top_user <- result[1:10,]

bar <- ggplot(top_user, aes(x=name, y=total_steps, fill=name)) + geom_bar(stat="identity") + scale_y_continuous(labels = comma)
print(bar)
