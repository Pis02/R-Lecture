# 저수준 적도 함수
var1 <- 1:5
plot(var1)
segments(2,2,3,3) #점 (2,2)와 (3,3)을 지나는 선분 그리기
arrows(5,5,4,4) #점 (5,5)와 (4,4)을 지나는 화살표 그리기
text(2,4,'labels')  #(a,b,'labels') -> (a,b) 위치에 문자열 labels 출력
text(2,4,"테스트",srt=45)  #(a,b,'테스트',srt=45) -> (a,b) 위치에 문자열 테스트 출력하는데 45도 기울여 출력

#par(mar=c(2,2,2,2),mfrow=c(1,1)) -> 기존 상태에서 밑에 출력하면 화면이 짤리므로 화면 사이즈 조정해주기
plot(1:15)
abline(h=8)  # 선 긋기
rect(1,6,3,8)  # 사각형 그리기
arrows(1,1,5,5) # 화살표 그리기
text(8,9,"TEXT")  # 글자 쓰기
title("THIS IS TEST","SUB")

