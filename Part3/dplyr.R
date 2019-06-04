library(googleVis)
library(dplyr)
Fruits
f2 <- filter(Fruits, Expenses > 80)
f2

Fruits %>%
  group_by(Fruits) %>%
  mutate(sumSales = sum(Sales))