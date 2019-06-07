# 그래픽 기호
setwd("D:/Workspace/R_Data_Analysis/Part4") #setwd() -> directory 설정하기
getwd() #getwd() 설정된 directroy 확인하기

var1 <- 1:5 #1:5 = c(1,2,3,4,5)와 같음
plot(var1) #plot() <- R에서 그래픽 관련 가장 많이 사용되는 함수

var1 <- 5:1 #5:1 순서로 표현
plot(var1)

var2 <- c(2,2,2)
plot(var2)
x <- 1:3
y <- 4:2
plot(x, y)
plot(x, y, xlim = c(0, 5), ylim = c(0, 5)) #x, y축에 lim를 사용해 시작부터 마무리 지점을 정해준다.
plot(x, y, xlim = c(0, 5), ylim = c(0, 5),
     xlab = "X축값", ylab = "Y축값", main="Plat Test")  #lab을 이용해 x,y축 제목 지정 및 main을 이용해 제목 지정정

v1 <- c(100,130,120,160,150)
plot(v1, type='o',col='red',ylim=c(0,200),axes=FALSE,ann=FALSE)
  axis(1,at=1:5,lab=c("MON","TUE","WED","THU","FRI"))
  axis(2,ylim=c(0,200))
  title(main="FRUIT",col.main="red",font.main=4)
  title(xlab = "Day",col.lab="black")
  title(ylab = "PRICE",col.lab="blue")

v1 <- c(100,130,120,160,150)
par(mfrow=c(1,3)) #한 화면에 여러 개의 그래프를 동시에 배치해야 하는 경우에 사용
                  #par(mfrow = c(nr,nc)) <- nr : 행의 갯수, nr : 열의 갯수
plot(v1,type="o")
plot(v1,type="s")
plot(v1,type="l")

v1 <- c(100,130,120,160,150)
par(mfrow=c(1,3))
pie(v1)
plot(v1,type="o")
barplot(v1)

par(mfrow=c(1,1))
a <- c(1,2,3)
plot(a,xlab = "aaa")
par(mgp=c(0,1,0)) # mgp = c(제목위치,지표값위치,지표선위치) 입니다.
plot(a,xlab="aaa")
par(mgp=c(3,1,0))
plot(a,xlab="aaa")
par(mgp=c(3,2,0))
plot(a,xlab="aaa")
par(mgp=c(3,2,1))
plot(a,xlab="aaa")
par(oma=c(2,1,0,0)) #oma = c() 그래프 전체의 여백 조정하기
plot(a,xlab="aaa")
par(oma=c(0,2,0,0))
plot(a,xlab="aaa")

par(mfrow=c(1,1))
v1 <- c(1,2,3,4,5)
v2 <- c(5,4,3,2,1)
v3 <- c(3,4,5,6,7)
plot(v1,type="s",col="red",ylim=c(1,7))
par(new=T)  #이 부분이 중복 허용 부분입니다.
plot(v2,type="o",col="blue",ylim=c(1,7))
par(new=T)  #이 부분이 중복 허용 부분입니다.
plot(v3,type="l",col="green",ylim=c(1,7))

par(mfrow=c(1,1))
v1 <- c(1,2,3,4,5)
v2 <- c(5,4,3,2,1)
v3 <- c(3,4,5,6,7)
plot(v1,type="s",col="red",ylim=c(1,10))
lines(v2,type="o",col="blue",ylim=c(1,5))
lines(v3,type="l",col="green",ylim=c(1,15)) #y축 제목이나 값들이 plot()함수를 par(new = T)를 이용해 중첩하는 것보다
                                            #훨씬 깔끔하므로 이 방법을 사용하길 추천

v1 <- c(1,2,3,4,5)
v2 <- c(5,4,3,2,1)
v3 <- c(3,4,5,6,7)
plot(v1, type = "s", col = "red", ylim=c(1,10))
lines(v2, type = "o", col = "blue", ylim=c(1,5))
lines(v3, type = "l", col = "green", ylim=c(1,15))

legend(4,9,c("v1","v2","v3"),cex=0.9,col=c("red","blue","green"),lty=1)
#범례 추가 <- legend(x축위치, y축위치, 내용, cex=글자크기, col=색상, pch=크기, lty=선모양)

x <- 1:5
barplot(x)

x <- 1:5
barplot(x,horiz=T) #옵션 horiz <- TRUE를 지정하면 막대를 옆으로 눕혀서 그립니다.

x <- matrix(c(5,4,3,2), 2,2)  #matrix(c(5,4,3,2), 2,2) = matrix(c(5,4,3,2), nrow=2)
x
barplot(x,beside=F) #beside = FALSE인 경우
barplot(x,beside=T) #beside = TRUE인 경우
barplot(x,beside=T,names=c(5,3), col=c("green","yellow")) #beside = TRUE이면서, 막대 이름 및 색상 지정정
barplot(x,beside=T,names=c(5,3), col=c("green","yellow"),
        horiz=T)  #위 값을 가로로 표현(옵션은 horiz)
par(oma=c(1,0.5,1,0.5)) #하, 좌, 상, 우 여백 지정
barplot(x,horiz=T,names=c(5,3),col=c("green","yellow"),xlim=c(0,10))

par(oma=c(0,0,0,0))
v1 <- c(100,120,140,160,180)
v2 <- c(120,130,150,140,170)
v3 <- c(140,170,120,110,160)
qty <- data.frame(BANANA=v1, CHERRY=v2, ORANGE=v3)  #qty <- 각 벡터를 모아서 데이터 프레임으로 만든다.
qty
barplot(as.matrix(qty),main="Fruit's Sales QTY",
        beside=T, col=rainbow(nrow(qty)),ylim=c(0,400))
legend(14,400,c("MON","TUE","WED","THU","FRI"),cex=0.8,fill=rainbow(nrow(qty))) #범주

barplot(t(qty),main="Fruit's Sales QTY",ylim=c(0,900), #Transpose = t() 전치 행렬
        col=rainbow(length(qty)),space=0.1,cex.axis=0.8,las=1,
        names.arg = c("MON","TUE","WED","THU","FRI"), cex=0.8)
legend(0.2,800,names(qty),cex=0.7,fill=rainbow(length(qty))) #범주 <- 위치를 지정하지 않으면 오류

peach <- c(180,200,250,198,170) #peach의 값이 200 이상일 경우 "red", 180~199일 경우 "yellow", 그 이하는 "green"
colors <- c()
for(i in 1:length(peach)){  #length는 배열의 길이를 계산해주는 함수이다.
  if(peach[i]>=200){
    colors <- c(colors,"red")
  } else if(peach[i]>=180){
    colors <- c(colors,"yellow")
    } else{
      colors <- c(colors,"green")
    }
  }
barplot(peach,main="Peach Sales QTY",
        names.arg=c("MON","TUE","WED","THU","FRI"), col=colors)

height <- c(182, 175, 167, 172, 163, 178, 181, 166, 159, 155)
par(mfrow=c(1,2))
barplot(height)
hist(height)  #히스토그램 hist() = 특정 데이터의 빈도수(도수)를 막대모양으로 표현한 것

par(mfrow=c(1,1))
p1 <- c(10,20,30,40)
pie(p1,radius=1)  #radius = 반지름 / 데이터의 기본은 반시계 방향으로 회전이 기본 
                  #clockwise(T) 시계방향 / clockwise(F) 반시계방향
pie(p1, radius=1, init.angle = 90)  #시작되는 지점에서 반시계방향으로 90도 회전
pie(p1, radius=1, init.angle = 90, col=rainbow(length(p1)), #col()로 색깔 지정
    label=c("Week1","Week2","Week3","Week4")) #label()로 각각의 이름 지정

pct <- round(p1/sum(p1) * 100,1)  #수치 값을 함께 출력, round(대상, 반올림할 자리수)=지정된 자리에서 반올림 하는 함수
lab <- paste(pct," %")  #paste(a,b)=두개를 붙여서 하나처럼 만드는 역할
pie(p1,radius=1,init.angle=90,col=rainbow(length(p1)),
    label=lab)
legend(1,1.1,c("Week1","Week2","Week3","Week4"),
       cex=0.5,fill=rainbow(length(p1)))

pct <- round(p1/sum(p1) * 100,1)  #범례를 생략하고 그래프에 바로 출력하기
lab1 <- c("Week1","Week2","Week3","Week4")
lab2 <- paste(lab1, "\n", pct, " %")
pie(p1,radius=1,init.angle=90,col=rainbow(length(p1)),label=lab2)

install.packages("plotrix") #pie3D() 함수를 사용하려면 해당 패키지를 설치해야한다.
library(plotrix)

p1 <- c(10,20,30,40,50)
f_day <- round(p1/sum(p1)*100,1)
f_label <- paste(f_day,"%")
pie3D(p1,main="3D Pie Chart",col=rainbow(length(p1)),
      cex=0.5,labels=f_label,explode=0.05)  #explode = 각 파이 조각간의 간격을 지정하는 파라미터
legend(0.5,1,c("MON","TUE","WED","THU","FRI"),cex=0.6,
       fill=rainbow(length(p1)))

v1 <- c(10,12,15,11,20)
v2 <- c(5,7,15,8,9)
v3 <- c(11,20,15,18,13)
boxplot(v1,v2,v3)

boxplot(v1,v2,v3,col=c("blue","yellow","pink"),
        names=c("Blue","Yellow","Pink"),
        horizontal=T) #여기에서는 horiz 옵션이 horizontal이다.

