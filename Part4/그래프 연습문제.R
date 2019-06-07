iris
View(iris)

plot(iris)

x <- mean(iris$Sepal.Length)
y <- iris$Species

barplot(x,y)

boxplot(x,y)

boxplot(iris$Species == 'setosa', mean(iris$Sepal.Length))
boxplot(iris$Species == 'setosa', iris$Sepal.Width)
boxplot(iris$Species == 'setosa', iris$Petal.Length)
boxplot(iris$Species == 'setosa', iris$Petal.Width)
boxplot(iris$Species == 'versicolor', iris$Sepal.Length)
boxplot(iris$Species == 'versicolor', iris$Sepal.Width)
boxplot(iris$Species == 'versicolor', iris$Petal.Length)
boxplot(iris$Species == 'versicolor', iris$Petal.Width)
boxplot(iris$Species == 'virginica', iris$Sepal.Length)
boxplot(iris$Species == 'virginica', iris$Sepal.Width)
boxplot(iris$Species == 'virginica', iris$Petal.Length)
boxplot(iris$Species == 'virginica', iris$Petal.Width)

boxplot(iris$Species == 'virginica'&&iris$Sepal.Length, iris$Sepal.Width, iris$Petal.Length, iris$Petal.Width)
