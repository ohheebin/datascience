library("ggplot2")
library("scales")

setwd('C:/Users/heebin/Documents/R/tashu') 
tashu <- read.csv('tashu.csv')

station_route <- data.frame(table(tashu$RENT_STATION,tashu$RETURN_STATION))

names(station_route)[1] <- "rent"
names(station_route)[2] <- "return"
names(station_route)[3] <- "routeFreq"
station <- station_route[order(-station_route$routeFreq),]
result <- station[1:20,]
result_route <- result[order(result$rent),]
freq <- result_route[[3]][1:20]

point <- ggplot(data = result_route, aes(rent, return, colour = routeFreq))
point + geom_point(shape=19, size=freq*0.0001259)
