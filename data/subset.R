library("lubridate")
library(ggplot2)
library(ggmap)
library(stringr)
library(scales)
library(data.table)
#ggplot 에서 한글 테마로 만들기
library(extrafont)
theme_set(theme_gray(base_family = "NanumGothic"))

#subset
tashu_2015_8_df <- subset(tashu, subset=(year==2015 & month==8))