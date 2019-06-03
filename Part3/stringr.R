install.packages("stringr")
library(stringr)

search()

fruits
str_detect(fruits, 'A')
str_detect(fruits, 'a')
str_detect(fruits, '^a')
str_detect(fruits, 'e$')
str_detect(fruits, '^[aA]') #시작하면서 a and A가 나오는 경우
str_detect(fruits, '[aA]') #시작하면서 a or A가 나오는 경우

str_detect(fruits, regex('a', ignore_case = T))

str_replace('apple', 'p', '*')
str_replace('apple', 'p', '**')
str_replace_all('apple', 'p', '*')

fruits <- str_c('apple', '/', 'orange', '/', 'banana')
fruits
str_split(fruits, "/") #split 결과는 리스트로 만들어져서 저장이 된다 -> ex) [[1]]

fruits
str_sub(fruits, start=1, end=3) #str_sub -> start 숫자 자리부터 시작해서 end 숫자만큼 표현
str_sub(fruits, start=6, end=9)
str_sub(fruits, start=6)
str_sub(fruits, end=9)

str_trim("     apple banana berry  ") #str_trim -> 블랭크, \n, \t 등 공백을 지워준다
str_trim("\t     apple banana berry  ")
str_trim("   apple banana berry    \n")
