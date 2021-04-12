vetor <- c(iris$Sepal.Length)


regressao <- lm(Sepal.Length ~ Petal.Length, data = iris)


summary(regressao)  


str(regressao)