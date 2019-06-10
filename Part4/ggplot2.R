# ggplot2
install.packages('ggplot2')
library(ggplot2)

getwd()
korean <- read.table("학생별국어성적_new.txt",header=T,sep=",")
korean

#geon_bar()
ggplot(korean,aes(x=이름,y=점수)) + #ggplot(data=korean,mapping=aes(x=이름,y=점수))와 동일하다. positional argument
  geom_point()  
ggplot(data=korean,mapping=aes(x=이름,y=점수)) + # keyword argument
  geom_point()  # 점으로 표현

ggplot(korean,aes(x=이름,y=점수)) + 
  geom_bar(stat = "identity") # 바(막대) 형태로 표현
ggplot(korean,aes(x=이름,y=점수)) + 
  geom_bar(stat = "identity", fill="green", colour="red") + #fill 및 colour로 색상 추가
  theme(axis.text = element_text(angle=45,hjust=1,vjust=1,color="blue",size=8)) #them=테마 옵션(글자나 배경 등을 제어)
  #테마를 수정하려면 element_xxxx 형태의 객체를 수정하고, text를 45도 회전시키기 위해 element_text 및 anlge=45를 지정
  #element_line, element_rect 등 있다.

score_kem <- read.csv("학생별과목별성적_국영수_new.csv",header=T) #과목별 이름과 점수로 정리되어 있음
score_kem
library(dplyr)  #arrange() 사용을 위해 dplyr 라이브러리 적용
install.packages('backports') #backprots 패키지가 필요하다고 오류가 나와서 설치 및 적용
library(backports)
sort_kem <- arrange(score_kem, 이름, 과목)  #이름과 과목별로 내용 순서를 변경
sort_kem

#sort_kem2 <- ddply(sork_kem,"이름",transform,누적합계=cumsum(점수))
sort_kem2 <- sort_kem %>%
  group_by(이름) %>%
  mutate(누적합계=cumsum(점수))
sort_kem2

#sort_kem3 <- ddply(sork_kem2,"이름",transform,누적합계=cumsum(점수),label=cumsum(점수)-0.5*점수)
sort_kem3 <- sort_kem2 %>%
  group_by(이름) %>%
  mutate(label=cumsum(점수)-0.5*점수)
sort_kem3

sort_kem4 <- sort_kem %>% #sort_kem, sort_kem2, sort_kem3 내용을 한번에 포함하여 출력
  group_by(이름) %>%
  mutate(누적합계=cumsum(점수), label=cumsum(점수)-0.5*점수)
sort_kem4

ggplot(sort_kem4,aes(x=이름,y=점수,fill=과목)) +
  geom_bar(stat = "identity") +
  geom_text(aes(y=label,label=paste(점수,'점')),colour="black",size=4) +
  #guides(fill=guide_legend(reverse=T)) + #코멘트 처리를 제거하면 순서가 이상하게 변경....된다.
  theme(axis.text.x=element_text(angle=45,hjust=1,vjust=1,colour="black",size=8))

#geom_segment()
score <- read.table("학생별전체성적_new.txt",header=T,sep=",")
score
score_eng <- score[,c("이름","영어")]
ggplot(score,aes(x=영어,y=reorder(이름,영어))) +
  geom_point(size=6) +
  theme_bw()  + #theme_bw() -> R에서 미리 만들어져 있던 흑과 백 만을 가지고 있는 테마, theme_XX() 옵션이 더 있다.
  theme(panel.grid.major.x = element_blank(), #panel.grid.major 배경화면 중에 간격을 나타내는 큰 선분
                                              #element_balck() 옵션을 적용해, 선분을 안보이게 했다.
        panel.grid.minor.x = element_blank(), #panel.grid.minor 큰 선분 사이에 있는 작은 선분
        panel.grid.major.y = element_line(color="red", linetype = "dashed"))  #가로로 빨간석 점선(dashed)를 적용

#geom_point(), scatterplots
install.packages('gridExtra')
library(gridExtra)
v_mt <- mtcars
v_mt

ggplot(v_mt,aes(x=hp,y=mpg)) +
  geom_point()
ggplot(v_mt,aes(x=hp,y=disp)) +
  geom_point()
ggplot(v_mt,aes(x=hp,y=mpg)) +
  geom_point(colour="blue") #색상 지정하기 -> color = colour 동일하다.
ggplot(v_mt,aes(x=hp,y=mpg)) +
  geom_point(aes(colour=factor(am)))  #종류별로 다른 색상 지정하기
ggplot(v_mt,aes(x=hp,y=mpg)) +
  geom_point(aes(colour=factor(am), size=5))  #size 지정하기
ggplot(v_mt,aes(x=hp,y=mpg)) +
  geom_point(aes(colour=factor(am), size=wt)) #size = wt 값 별로 다른 크기 지정하기
ggplot(v_mt,aes(x=hp,y=mpg)) +
  geom_point(aes(shape=factor(am), size=wt)) #shape 종류별로 크기와 모양 지정하기기
ggplot(v_mt,aes(x=hp,y=mpg)) +
  geom_point(aes(shape=factor(am),color=factor(am),size=wt)) +
  scale_color_manual(values=c("red","green")) #종류별로 크기, 모양, 색상 지정하기
ggplot(v_mt,aes(x=hp,y=mpg)) +
  geom_point(color="red") +
  geom_line(colour="blue") #선 추가 및 색상 지정하기
ggplot(v_mt,aes(x=hp,y=mpg)) +
  geom_point(color="blue") +
  labs(x="마력",y="연비(mile/gallon)")  #x축과 y축 이름 바꾸기

#geom_line()
three <- read.csv("학생별과목별성적_3기_3명.csv",header=T)
three

sort_score <- arrange(three,이름,과목)
sort_score
ggplot(sort_score,aes(x=과목,y=점수,color=이름,group=이름)) +
  geom_line() #이름을 기준으로 묶어서(group=이름) line 그래프로 출력
ggplot(sort_score,aes(x=과목,y=점수,color=이름,group=이름)) +
  geom_line() + 
  geom_point()  #위 그래프에 점을 추가해서 출력
ggplot(sort_score,aes(x=과목,y=점수,color=이름,group=이름,fill=이름)) +  #fill=이름 설정에 의해 네모칸이 색칠 되었고,
geom_line() + #linetype = 선의 모양을 바꿀 수 있는 옵션
  geom_point(size=6,shape=22) #geom_point()에서 size와 포인터 모양을 shape 항목으로 지정
ggplot(sort_score,aes(x=과목,y=점수,color=이름,group=이름,fill=이름)) +
  geom_line() +
  geom_point(size=6,shape=22) +
  ggtitle("학생별 과목별 성적") #그래프의 타이틀 제목 지정

#geom_area()
dis <- read.csv("1군전염병발병현황_년도별.csv", stringsAsFactors=F)
dis

ggplot(dis,aes(x=년도별,y=장티푸스,group=1)) +
  geom_line() #geom_line()함수를 사용하여 그린 그림
ggplot(dis,aes(x=년도별,y=장티푸스,group=1)) +
  geom_area() #geom_area(함수를 사용하여 그린 그림
ggplot(dis,aes(x=년도별,y=장티푸스,group=1)) +
  geom_line(color="red") +
  geom_area(fill="cyan",alpha=0.4)  #geom_line() 및 geom_area() 옵션을 추가하여 그린 그림

