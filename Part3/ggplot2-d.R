library(ggplot2)
View(mpg)
library(dplyr)

mpg %>%
  mutate(avg_spd = (cty + hwy) / 2) %>% #mutate 새로운 변수를 만든다
  group_by(class) %>%
  summarise(class별평균속도 = mean(avg_spd)) %>%
  arrange(desc(class별평균속도)) %>%
  head(5)

mpg %>%
  mutate(avg_spd = (cty + hwy) / 2) %>%
  select(manufacturer, class, cty, hwy, avg_spd) %>%
  head(5) #위에서 5개만 출력

#mpg 연비 / disp 배기량 -> 가장 좋은 놈 5개 출력
mtcars %>%
  mutate(mpg_per_disp = (mpg / disp)) %>%
  arrange(desc(mpg_per_disp)) %>%
  head(5)
  
#cyl 실린더별 hp 마력 수 평균
mtcars %>%
  group_by(cyl) %>%
  summarise(실린더별마력수평균 = mean(hp)) %>%
  arrange(desc(실린더별마력수평균)) #내림차수 적용?

#cyl 실린더별 disp 배기량 / hp 마력의 평균
mtcars
mtcars %>%
  group_by(cyl) %>%
  summarise_each(funs(mean, n()), disp, hp) #혹은 summarise_each(list(mean), disp, hp)

iris #품종별 4개의 꽃받침 Sepal, 꽃잎 Petal 평균 -> ex)인공지능으로 사이즈 확인 및 결과 도출도 한다.
iris %>%
  group_by(Species) %>%
  summarise_each(list(mean), Sepal.Length, Sepal.Width, Petal.Length, Petal.Width)
  #혹은 summarise_each(funs(mean, n()), Sepal.Length, Sepal.Width, Petal.Length, Petal.Width)
