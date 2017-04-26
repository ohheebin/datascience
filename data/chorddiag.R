#chorddiag
library(chorddiag)
library(ggplot2)
library(ggmap)
library(stringr)
library(scales)
library(data.table)
#ggplot 에서 한글 테마로 만들기
library(extrafont)
theme_set(theme_gray(base_family = "NanumGothic"))

setwd('/Users/heebin/Desktop/week02')
top20_trace <- read.csv('top20_result.csv')
station <- read.csv('station.csv')

top20_trace_matrix <- matrix(0, 108, 108)

for(i in 1:20) {
  from <- top20_trace[i, 1]
  to <- top20_trace[i, 2]
  freq <- top20_trace[i, 3]
  top20_trace_matrix[from, to] <- freq
}

palette <- c("#466791","#60bf37","#953ada","#4fbe6c","#ce49d3",
             "#a7b43d","#5a51dc","#d49f36","#552095","#507f2d",
             "#db37aa","#84b67c","#a06fda","#df462a","#5b83db",
             "#c76c2d","#4f49a3","#82702d","#dd6bbb","#334c22")
haircolors <- head(station$명칭, 108)
dimnames(top20_trace_matrix) <- list(have = haircolors, prefer = haircolors)
top20_trace_chord <- chorddiag(top20_trace_matrix, groupColors = palette,
                               groupnamePadding = 40, groupnameFontsize = 10)

top20_trace_chord