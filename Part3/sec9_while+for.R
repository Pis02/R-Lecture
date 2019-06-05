# while 반복문

no <- 0
while (no < 5){
  print(no)
  no <- no+1;
}

no <- 0
while (no < 5){
  print(no)
  if(no == 3){
    break
  }
  no <- no+1;
}
#break 문을 사용하면 원하는 값에서 중단할 수 있다.

#0->10까지 짝수만 찍고 홀수는 넘어가기
#ex1
no <- 0
while (no < 11){
  if(no%%2==0)
    print(no)
  no <- no+1;
}
#ex2
no <- -1
while (no < 11){
  no <- no+1
  if(no%%2==1)
    next
  print(no)
}

#-------------------------------------------------------------------------------------------------------

# for 반복문
for(i in 1:10){
  print(i)
}

sum <- 0
for(i in 1:100){
  sum <- sum + i
}
print(sum)
# 1~100까지의 합

sum <- 0
for(i in 1:100){ #for(i in 1:100:3)으로도 표현 가능
  if(i %% 3 == 0){
    sum <- sum + i
  }
}
print(sum)
# 1~100까지의 숫자 중 3의 배수의 합

multiple <- function(limit, number){
  sum <- 0
  for(i in 1:limit){
    if(i %% number == 0)
      sum <- sum + i
  }
  return(sum)
}
multiple(1000, 4)
# 1부터 limit 입력한 숫자까지중에 number 입력한 숫자의 배수의 합
#ex) 1~1000까지의 숫자 중 4의 배수의 합

library(stringr)
for (i in 1:5){
  line <- ''
  for(k in 1:i){
    line <- str_c(line, '#')
  }
  print(line)
}
# '#'모양 1개부터 -> 2 -> 3 -> 4 -> 5 역순 모양으로 출력

for (i in 1:5){
  line <- ''
  if(i!=1){
    for(k in 1:(i-1))
      line <- str_c(line, ' ')
  }
  for(k in i:5){
    line <- str_c(line, '#')
  }
  print(line)
}
# '#'모양 5개부터 -> 4 -> 3 -> 2 -> 1 역순 모양으로 출력

for (i in 2:9){
  for(k in 1:9){
    print(paste(i, '*', k, '=', i*k))
  }
}
#구구단 2단부터 9단까지 출력
#paste -> 문자열을 붙이는 역할!!!!

While (T) {
  for (i in 1:4){
    line <- ''
    if(i!=4){
      for(k in 1:(3-(i-1)))
        line <- str_c(line, ' ')
    }
    for(k in i:(2*i-1))
      line <- str_c(line, '#')
    print(line)
  }
  for (i in 3:1){
    line <- ''
    for(k in 1:(3-(i-1)))
      line <- star
  }
}
#다이아몬드 확인 필요!!!!!!!!!!!!!!!

#약수 구하는거 확인 필요!!!!!!!!!!!
