library(ggplot2)
View(mpg)
library(dplyr)

mpg %>%
  filter(manufacturer %in% c('f', 'r', '4')) %>%
  group_by(manufacturer) %>%
  summarise(평균=mean((cty + hwy) / 2))
