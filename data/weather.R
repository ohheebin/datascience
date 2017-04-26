#날씨 상관 관계
library(ggplot2)
library(ggmap)
library(stringr)
library(scales)
library(data.table)
#ggplot 에서 한글 테마로 만들기
library(extrafont)
theme_set(theme_gray(base_family = "NanumGothic"))

# Read weather data
setwd('/Users/heebin/Desktop/week02')
may_weather <- read.csv('weather_05.csv')
august_weather <- read.csv('weather_08.csv')
tashu <- read.csv('tashu_result.csv')

#group을 뽑아내서 sum해주는것 
may_day_total_rain <- aggregate(rain~day,may_weather,sum)
may_day_total_rain
may_weather


# Get top temperature, rain
may_top_temperature <- head(may_weather[order(-may_weather$temperature),],1)

may_top_rain <- head(may_day_total_rain[order(-may_day_total_rain$rain),],1)

#inner join 같은애들만 붙여주고 없는 것들은 없앤다.
may_top_rain <- merge(may_top_rain, may_weather, by='day')

august_top_temperature <- head(august_weather[order(-august_weather$temperature),],1)
august_top_rain <- head(august_weather[order(-august_weather$rain),],1)


may_top_temperature$year
station_2014_may_temp <- subset(tashu, select = c(RENT_STATION, RENT_DATE), 
                                subset = ((year == may_top_temperature$year) & 
                                            (month == may_top_temperature$month) &
                                            (day == may_top_temperature$day)))
station_2014_may_temp_cnt <- data.frame(table(station_2014_may_temp$RENT_STATION))
colnames(station_2014_may_temp_cnt) <- c("station", "temp_count")

station_2014_may_rain <- subset(tashu, select = c(RENT_STATION, RENT_DATE), 
                                subset = ((year == may_top_rain$year[1]) & 
                                            (month == may_top_rain$month[1]) &
                                            (day == may_top_rain$day[1])))
station_2014_may_rain
station_2014_may_rain_cnt <- data.frame(table(station_2014_may_rain$RENT_STATION))
colnames(station_2014_may_rain_cnt) <- c("station", "rain_count")


#기온이 높을 떄와 강수량이 많을때의 대여수의 차를 sort해서 뽑아낸다.
station_2014_relation <- merge(station_2014_may_temp_cnt, station_2014_may_rain_cnt, by='station')
station_2014_relation
station_2014_relation$diff <- abs(station_2014_relation$temp_count - station_2014_relation$rain_count)
sorted_station_2014_relation <- station_2014_relation[order(-station_2014_relation$diff),]
sorted_station_2014_relation