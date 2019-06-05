# 정규표현식

char <- c('apple', 'Apple', 'APPLE', 'banana', 'grape')
grep('apple',char)
#grep을 이용해 특정 패턴을 찾아내기

char2 <- c('apple', 'banana')
grep(char2, char)
grep(paste(char2, collapse='|'), char, value=T)

grep('pp', char)
grep('pp', char, value = T) #pp가 포함된 단어 찾기
grep('^A', char, value = T) #첫번째 글자가 A인 단어 찾기
grep('e$', char, value = T) #마지막 글자가 e인 단어 찾기

char2 <- c('grape1', 'apple1', 'apple', 'orange', 'Apple')
grep('ap', char2, value= T) # ap가 포함된 단어 찾기
grep('[1-9]', char2, value=T) # 숫자가 포함된 단어 찾기
grep('\\d', char2, value=T) # 숫자와 동일한 표현 \\d
grep('[[:upper:]]',char2, value=T) #대문자가 포함된 단어 찾기1
grep('[A-Z]',char2, value=T) #대문자가 포함된 단어 찾기2

char
nchar(char)
nchar('James Seo')
nchar('서진수')

paste('Seo', 'Jin', 'Su') #기본값은 각 값들 사이에 공백이 생긴다
paste('Seo', 'Jin', 'Su', sep='') #자동으로 들어가는 구분자(공백)을 지운다
paste('Seo', 'Jin', 'Su', sep='/') #구분자 / 를 지정한다
paste('I', '\'m','Hungry') #특수문자가 있을 경우 Escape character (\) 써야 한다

substr('abc123',3,3) #substr('a',시작위치,끝나는 위치)
substr('abc123',3,4) #substr('a',시작위치,끝나는 위치)

strsplit('2014/11/22',split='/') #strsplit('문자열', split='기준문자') -> 문자열에서 split 부분의 글자를 기준으로 분리

grep('-','010-8706-4712') #grep으로는 위치를 찾을 수 없다
regexpr('-','010-8706-4712') #처음 나오는 '-' 문자 위치 찾기
attr(,"match.length") #오류 확인 필요!!!!!!!!!!!
attr(,"useBytes") #오류 확인 필요!!!!!!!!
