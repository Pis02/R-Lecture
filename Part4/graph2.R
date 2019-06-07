# 관계도
install.packages("igraph")
library(igraph)
g1 <- graph(c(1,2, 2,3, 2,4, 1,4, 5,5, 3,6))
plot(g1)
str(g1)

name <- c('서진수 대표이사', '일지매 부장', '김유신 과장', '손흥민 대리', '노정호 대리',
          '이순신 부장', '유관순 과장', '신사임당 대리', '강감찬 부장', '광개토 과장', '정몽주 대리')
pemp <- c('서진수 대표이사', '서진수 대표이사', '일지매 부장', '김유신 과장', '김유신 과장',
          '서진수 대표이사', '이순신 부장', '유관순 과장', '서진수 대표이사',
          '강감찬 부장', '광개토 과장')
emp <- data.frame(이름=name, 상사이름=pemp)
emp
g <- graph.data.frame(emp,directed=T)
plot(g,layout=layout.fruchterman.reingold,vertex.size=8,edge.arrow.size=0.5)  #1. 그림 읽고,
png("graph/network_2.png", width=600, height=600) #1.1 그림파일 저장하는 법
plot(g,layout=layout.fruchterman.reingold,vertex.size=8,edge.arrow.size=0.5)  #2. 그림 읽고,
dev.off() #2.1 그림 저장하는 법

g3 <- graph.data.frame(emp,directed=F)
plot(g3,layout=layout.fruchterman.reingold,vertex.size=8,
     edge.arrow.size=0.5, vertex.label=NA) #화살표와 이름이 안나오게 하는 경우
png("graph/network_3.png", width=600, height=600)
plot(g3,layout=layout.fruchterman.reingold,vertex.size=8,
     edge.arrow.size=0.5, vertex.label=NA)
dev.off()

plot(g3,layout=layout.random,vertex.size=8, #layout 옵션을 random으로 넣으면 실행할때마다 layout이 바뀐다.
     edge.arrow.size=0.5, vertex.label=NA)

#--------------------------------------------------------------------------------------------------------------

install.packages("devtools")
install.packages('backports')
library(devtools)
install_github("christophergandrud/d3Network")
library(RCurl)
library(d3Network)
install.packages("d3Network")

name <- c('Angela Bassett','Jessica Lange','Winona Ryder','Michelle Pfeiffer',
          'Whoopi Goldberg','Emma Thompson','Julia Roberts','Sharon Stone','Meryl Streep',
          'Susan Sarandon','Nicole Kidman')
pemp <- c('Angela Bassett','Angela Bassett','Jessica Lange','Winona Ryder','Winona Ryder',
          'Angela Bassett','Emma Thompson', 'Julia Roberts','Angela Bassettlibrary(RCurl)',
          'Meryl Streep','Susan Sarandon')
emp <- data.frame(이름=name,상사이름=pemp)
d3SimpleNetwork(emp,width=600,height=600,file="c:\\temp\\d3.html")

g <- read.csv("d:/workspace/r_data_analysis/part4/data/군집분석.csv",head=T)
graph1 <- data.frame(학생=g$학생,교수=g$교수)
g<-graph.data.frame(graph1,directed=T)
plot(g,layout=layout.fruchterman.reingold,vertex.size=2,
     edge.arrow.size=0.5, vertex.color="green",vertex.label=NA)
#모양 바꾸어서 출력하기
plot(g,layout=layout.kamada.kawai,vertex.size=2,
     edge.arrow.size=0.5,vertex.label=NA)

V(g)$name
gubun1 <- V(g)$name
gubun1
library(stringr)
gubun <- str_sub(gubun1,start=1,end=1)
gubun
colors <- c()
sizes <- c()
for ( i in 1:length(gubun)) {
  if (gubun[i] == 'S' ) {
    colors <- c(colors,"red")
    sizes <- c(sizes,2) 
  } else { 
    colors <- c(colors,"green") 
    sizes <- c(sizes,6) 
  }
}
plot(g,layout=layout.fruchterman.reingold,vertex.size=sizes,edge.arrow.size=0.5,
     vertex.color=colors)
plot(g,layout=layout.fruchterman.reingold,vertex.size=sizes,edge.arrow.size=0.5,
     vertex.color=colors,vertex.label=NA) #이름 없애고 출력
plot(g,layout=layout.fruchterman.reingold,vertex.size=sizes,edge.arrow.size=0,
     vertex.color=colors,vertex.label=NA) #화살표 표시 없애고 출력
plot(g,layout=layout.kamada.kawai,vertex.size=sizes,edge.arrow.size=0,
     vertex.color=colors,vertex.label=NA) #학생과 교수의 도형 모양 다르게 하고, 화살표 없애고, 색상도 변경하고 출력

shapes <- c()
for ( i in 1:length(gubun)) {
  if (gubun[i] == 'S' ) {
    shapes <- c(shapes,"circle") }
  else { 
    shapes <- c(shapes,"square") }
}

plot(g,layout=layout.kamada.kawai,vertex.size=sizes,edge.arrow.size=0,
     vertex.color=colors,vertex.label=NA,vertex.shape=shapes)
#교수님일 경우 모양을 square로 하고, 점의 모양을 circle로 하는 코드

virus1 <- read.csv("d:/workspace/r_data_analysis/part4/data/메르스전염현황.csv",header=T)
d3SimpleNetwork(virus1,width=1200,height=900,file="graph/mers.html")