#1달간 step heatmap
library(ggplot2)
library(ggmap)
library(stringr)
library(scales)
library(data.table)
library(treemap)
#ggplot 에서 한글 테마로 만들기
library(extrafont)
theme_set(theme_gray(base_family = "NanumGothic"))

setwd('/Users/heebin/Desktop/python-fitbit-master')
data <- read.csv('result_step.csv')
data2 <- read.csv('result_step_15min.csv')
sleep <- read.csv('result_sleep.csv')

#total_step 데이터에 sleep 데이터 추가
data <- cbind(data, sleep$sleep)
names(data)[10] = "sleep"

#treemap 주와 요일 별로 나누고 크기는 total_steps 색은 sleep
treemap(data,
       index=c("week", "weekday_name"),
       vSize=c("total_steps"),
       title.legend="sleep",
       vColor="sleep",
       type="value")