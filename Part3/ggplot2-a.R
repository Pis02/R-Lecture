library(ggplot2)
View(mpg)
library(dplyr)

mpg %>%
  filter(manufacturer %in% c('audi', 'toyota')) %>%
  group_by(manufacturer) %>%
  summarise(고속도로연비평균=mean(hwy)) #summarise 주어진 데이터를 집계한다 / mean 평균 값
