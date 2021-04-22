distNormal1 <- rnorm(500, sd = 1)
distNormal2 <- rnorm(500, sd = 2)

summary(distNormal1)
summary(distNormal2)


binomialneg <- rnbinom(500, mu = 3, size = 10)

poissonSimulacao <- rpois(500, 3)

variaveldummy <- rbinom(500, 1, 0.5)

variavel_index <- seq(1, length(distNormal1))

variavelcategorica <- ifelse(variaveldummy, "TRUE", "FALSE")

dataframe <- data.frame(binomialneg, poissonSimulacao, variaveldummy, variavel_index, variavelcategorica)

centraldist1 <- distNormal1 - mean(distNormal1)

centraldist2 <- distNormal2 - mean(distNormal2)

dataframe$poissonSimulacao <- replace(dataframe$poissonSimulacao, dataframe$poissonSimulacao == "1", "0")

amostra <- sample(nrow(dataframe), 100)

amostra_df <- dataframe[amostra, ]
