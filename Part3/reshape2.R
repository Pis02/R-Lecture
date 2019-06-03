install.packages("reshape2")
library(reshape2)

fruits
melt(fruits, id='year')
melt(fruits, id=c('year','name'))
melt(fruits, id=c('year','name'), variable.name='변수명',
     variable.name='변수값')
mtest <- melt(fruits, id=c('year','name'), variable.name='변수명',
              variable.name='변수값')
dcast(mtest,year+name~변수명)

search()