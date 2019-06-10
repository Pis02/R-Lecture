library(dplyr)
library(ggplot2)

#mpg 데이터의 cty(도시 연비)와 hwy(고속도로 연비) 간에 어떤 관계가 있는지 알아보려고 합니다.
#x축은 cty, y축은 hwy로 된 산점도를 만들어 보세요
#1번 문제
mpg
ggplot(mpg, aes(x=cty,y=hwy)) +
  geom_point()


#미국 지역별 인구통계 정보를 담은 ggplot2 패키지의 midwest 데이터를 이용해서 전체 인구와 아시아인 인구 간에 
#어떤 관계가 있는지 알아보려고 합니다. x축은 poptotal(전체 인구), y축은 popasian(아시아인 인구)으로 된 
#산점도를 만들어 보세요. 전체 인구는 50만 명 이하, 아시아인 인구는 1만 명 이하인 지역만 산점도에 표시되게 설정하세요.
#2번 문제
midwest
ggplot(midwest, aes(x=poptotal,y=popasian)) +
  geom_point() +
  xlim(0,500000) + ylim(0,10000)

#어떤 회사에서 생산한 "suv" 차종의 도시 연비가 높은지 알아보려고 합니다. "suv" 차종을 대상으로 평균 cty(도시 연비)가 
#가장 높은 회사 다섯 곳을 막대 그래프로 표현해 보세요. 막대는 연비가 높은 순으로 정렬하세요. 
#3번 문제
mpg
company <- mpg %>%
  filter(class=='suv') %>%
  group_by(manufacturer) %>%
  summarise(mean_cty = mean(cty)) %>%
  arrange(desc(mean_cty)) %>%
  head(5)

ggplot(company, aes(x=reorder(manufacturer, -mean_cty), y=mean_cty)) +
  geom_bar(stat='identity')                                         
#x축 값에 reorder을 사용해 높은 수치에서 낮은 수치로 나열, -mean_cty를 사용하면서 높은 값이 맨 앞으로 나열

#자동차 중에서 어떤 class(자동차 종류)가 가장 많은지 알아보려고 합니다.
#자동차 종류별 빈도를 표현한 막대 그래프를 만들어 보세요.
#4번 문제
ggplot(mpg, aes(x=class)) +
  geom_bar()

#economics 데이터를 이용해서 psavert(개인 저축률)가 시간에 따라서 어떻게 변해왔는지 알아보려고 합니다. 
#시간에 따른 개인 저축률의 변화를 나타낸 시계열 그래프를 만들어 보세요.
#5번 문제
economics
ggplot(economics, aes(x=date, y=psavert)) +
  geom_line()

#class(자동차 종류)가 "compact", "subcompact", "suv"인 자동차의 cty(도시 연비)가 어떻게 다른지 비교해보려고 합니다. 
#세 차종의 cty를 나타낸 상자 그림을 만들어보세요.
#6번 문제
mpg
car <- mpg %>%
  filter(class%in% c('compact','subcompact','suv'))

ggplot(car, aes(x=class,y=cty)) +
  geom_boxplot()

#Diamonds 데이터 셋을 이용하여 다음 문제를 해결하세요. 단, 컬러, 제목, x축, y축 등 그래프를 예쁘게 작성하세요.
#cut의 돗수를 보여주는 그래프를 작성하세요.
#7-1번 문제
ggplot(diamonds, aes(x=cut, fill=cut)) +
  geom_bar()

#cut에 따른 가격의 변화를 보여주는 그래프를 작성하세요. 
#7-2번 문제
df_cut <- diamonds %>%
  group_by(cut) %>%
  summarise(mean_price = mean(price))
ggplot(df_cut, aes(x=cut,y=mean_price,fill=cut)) +
  geom_bar(stat='identity')

#cut과 color에 따른 가격의 변화를 보여주는 그래프를 작성하세요.
#7-3번 문제
df_color <- diamonds %>%
  group_by(color) %>%
  summarise(mean_price = mean(price)) 
gcolor <- ggplot(df_color, aes(x=color, y=mean_price, fill=color)) +
  geom_col()
gcut <- ggplot(df_cut, aes(x=cut, y=mean_price, fill=cut)) +
  geom_col()
library(grid)
library(gridExtra)
grid.arrange(gcut, gcolor, ncol=2, top = "cut과 color에 따른 가격의 변화")

#이런 방법도 있다.  
ggplot(diamonds, aes(x=price)) +
  geom_histogram(bins=10) +
  facet_wrap(~cut + color)
  
