library(ggplot2)
View(mpg)
library(dplyr)

mpg %>%
  filter(manufacturer %in% c('chevrolet', 'ford', 'honda')) %>%
  group_by(manufacturer) %>%
  summarise(시내도로연비평균=mean(cty))
