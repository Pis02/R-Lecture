# sqldf() 패키지 활용
install.packages("sqldf")
library(sqldf)
library(googleVis)
Fruits

sqldf('SELECT * FROM Fruits')
sqldf("SELECT * FROM Fruits WHERE Fruit='Apples'")
# " " 활용
sqldf('SELECT * FROM Fruits WHERE Fruit=\'Apples\'')
#\ \백슬러쉬 활용
sqldf('SELECT * FROM Fruits LIMIT 3')
#LIMIT 사용으로 시작줄부터 3줄만 출력 = LIMIT 0, 3
sqldf('SELECT * FROM Fruits LIMIT 3, 5')
#LIMIT 사용으로 3번째줄부터 출력해서 5줄만 출력

sqldf('SELECT * FROM Fruits ORDER BY Year')
#ORDER BY Year별로 정렬해서 출력
sqldf('SELECT * FROM Fruits ORDER BY Year DESC')
#ORDER BY * DESC 역순으로 정렬해서 출력
sqldf('select Fruit, sum(Sales) from Fruits group by Fruit')
#Fruit별 판매량의 합
sqldf('select Fruit, sum(Sales), sum(Expenses), sum(Profit) from Fruits group by Fruit')
#Fruit별 판매량, 가격, 이익의 합
sqldf('select Year, avg(Sales), avg(Expenses), avg(Profit) from Fruits group by Year')
#Year별 판매량, 가격, 이익의 평균
sqldf('select Year, avg(Sales), avg(Expenses), avg(Profit)
      from Fruits group by Year ORDER BY avg(Profit) desc')
#Year별 판매량, 가격, 이익의 평균을 출력할 때 이익의 평균은 내림차순으로 출력
sqldf('SELECT min(Sales), max(Sales) FROM Fruits')
#전체중에서 sales의 최대값, 최소값 구하기
sqldf('SELECT * FROM Fruits where Sales=81')
#최대값, 최소값을 출력 후 매출의 최소값, 최대값에 해당하는 정보 확인 가능(가능하지만 번거롭다...)
sqldf('SELECT * FROM Fruits where Sales=(select min(Sales) from fruits)')
#판매량이 최소인 놈의 정보를 가져오기
sqldf('SELECT * FROM Fruits where Expenses=(select max(Expenses) from fruits)')
#비용이 최대인 놈의 정보를 가져오기

getwd()
#내가 불러오는 위치 확인
song <- read.csv("song.csv", header = F, fileEncoding = 'utf8')
#내가 지정되어 있는 폴더에서 해당하는 엑셀파일 불러오기 및 header / encoding 설정
names(song) <- c('_id', 'title', 'lyrics', 'girl_group_id')
#내가 불러온 엑셀 파일 각각 분류 이름 설정
song
#song 출력
girl_group <- read.csv("girl_group.csv", header = F, fileEncoding = 'utf8')
names(girl_group) <- c('_id', 'name', 'debut')
girl_group

sqldf("select gg._id, gg.name AS '걸그룹 이름', gg.debut AS '데뷰', s.title AS '제목'
      from girl_group AS gg
      INNER JOIN song AS s
      ON gg._id = s.girl_group_id")
#_id, name, debut, title이 한글은 깨지는데 이름 변경하는 법 참고
sqldf("select gg._id, gg.name AS '걸그룹 이름', gg.debut AS '데뷰', s.title AS '제목'
      from girl_group gg
      JOIN song s
      ON gg._id = s.girl_group_id")
#INNER와 AS는 생략해도 작동 가능 / 이름 변경할 때 AS는 생략하면 안됌

sqldf(c('UPDATE Fruits SET Profit=50 WHERE Fruit=\'Apples\' AND Year=2008', 'select * from Fruits'))
#실제 데이터를 변경하는 것이 아니라 지금 화면에 보이는 내용만 변경한 것
#이 내용을 영구적으로 저장하려면 반드시 저장을 해야 합니다.
