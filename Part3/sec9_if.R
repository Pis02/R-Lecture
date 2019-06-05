# 조건문
myAbs <- function(x) {
  if (x >= 0) {
    return(x)
  } else {
    return(-x)
  }
}
myAbs(-3.2)
myAbs(4.5)
#if 조건식의 간단한 예

myAbs2 <- function(x) {
  if (x >= 0) {
    return(x)
  }
  return(-x)
}
myAbs2(-3.2)
myAbs2(4.5)
#if 조건식의 간단한 예2(else문은 따로 없어도 중괄호 뒤에 조건을 붙이면 동일하게 적용)

myF1 <- function(x){
  if (x > 0) {
    return(x*x)
  } else{
    return(0)
  }
}
myF1(4.6)
myF1(-2.4)
#if 조건식의 간단한 예3

myF2 <- function(x){
  if (x>0){
    return(2*x)
  } else if(x==0){
    return(0)
  } else {
    return(-2*x)
  }
}
myF2(4.6)
myF2(0)
myF2(-2.4)
#if ~ else if 조건식의 간단한 예1

number <- scan()
#scan() -> 값 입력 후 엔터 두번 치면 등록 됨
result <- ifelse(number%%2 == 0, '짝수', '홀수')
result

#1번 문제
ex1 <- function(x){
  if(x>5){
    return(1)
  } else{
    return(0)
  }
}
ex(5)
ex(6)

#2번 문제
ex2 <- function(x){
#return(ifelse(x > 0, 1, 0)) 이렇게 사용해도 동일!
    if(x>0){
    return(1)
  } else{
    return(0)
  }
}
ex2(1)
ex2(-1)

#3번 문제
ex3 <- function(x){
  if(x-y>0){
    return(x-y)
  } else if(x-y<0){
    return(y-x)
  }
}
ex3(10,20)

#4번 문제
# 1<=x<=5 -> x>=1 & x<=5
# 1<x<5 -> x>1 | x<5
myf4 <- function(x){
  if(x<0){
    return(0)
  } else if(x>=1 && x<=5){
    return(1)
  } else if(x>5){
    return(10)
    } else {
      return(-1)
  }
}
myf4(6)
xx <- c(T, T, F)
yy <- c(F, T, F)
xx & yy
xx && yy


#5번 문제
myf5 <- function(x){
  if(x == 'Y' || x == 'y'){
    return('Yes')
  } else{
    return('Not Yes')
  }
}
ans <- scan(what=" ")
myf5(ans)

#추가 문제
#myIntD ->(a,b,c) 정수, myRealD ->(a,b,c) 실수
myIntD  <-  function ( a , b , c ) {
  D  =  b * b  -  4 * a * c
  if ( D  >  0 ) {
    return ( 2 )
  } else  if ( D  ==  0 ) {
    return ( 1 )
  } else {
    return ( 0 )
  }
}

myRealD  <-  function ( a , b , c ) {
  D  =  b * b  -  4 * a * c
  print ( D )
  if (abs ( D ) <  1e-5 ) {
    return ( 1 )
  } else  if ( D  >  0 ) {
    return ( 2 )
  } else {
    return ( 0 )
  }
} 

a  <-  40.0 / 39.9999999999
b  <-  - 2.00000000001
c  <-  1.0000000002
myIntD ( a , b , c)
myRealD ( a , b , c )
