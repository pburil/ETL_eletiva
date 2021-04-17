install.packages("devtools")

library(devtools)
library(rlang)

devtools::install_github("vdeminstitute/vdemdata")

vdemdata::vdem

vdem <- vdemdata::vdem

## Distribuição com a variável normal v2x_polyarchy (to what extent is the ideal of electoral democracy in its fullets sense achieved?)

tarefaSemente <- addTaskCallback(function(...) {set.seed(123);TRUE}) # atribui a tarefa à variável tarefaSemente
tarefaSemente

vdem$v2x_polyarchy

distribuicaonormal <- rnorm(100, vdem$v2x_polyarchy)

summary(distribuicaonormal)


##Distribuição binomial com a probabilidade de a moeda cair cara ou coroa com a probabilidade de cada teste de 0.5

distribuicaobinomial <- rbinom(100, 1, 0.5)


# repetições
classeSimulacao <- c(rep("Cara", length(distribuicaobinomial)/2), rep("Coroa", length(distribuicaobinomial)/2))

# sequências

indexSimulacao <- seq(1, length(distribuicaonormal)) 


# amostragem sem reposição usando função sample
sample(distribuicaonormal, 15, replace = FALSE)

# amostragem com reposição usando função sample
sample(distribuicaonormal, 15, replace = TRUE)

# bootstraping com função replicate
set.seed(412) 

bootsDistNormal10 <- replicate(10, sample(distribuicaonormal, 10, replace = TRUE))

# replicamos 10x a amostra, criando assim um bootstrapping
bootsDistNormal10


mediaBootsNormal10 <-replicate(10, mean(sample(distribuicaonormal, 10, replace = TRUE))) 



mediaBootsNormal50 <-replicate(50, mean(sample(distribuicaonormal, 10, replace = TRUE))) 



mediaBootsNormal100 <-replicate(100, mean(sample(distribuicaonormal, 10, replace = TRUE)))

#Comparando
mean(mediaBootsNormal10) # media do boostraping 10
mean(mediaBootsNormal50) # media do boostraping 50
mean(mediaBootsNormal100) # media do boostraping 100
mean(distribuicaonormal) # media dos dados originais

# partições
install.packages('caret', dependencies = T) 
library(caret)



# Partição dos dados
particaoDistNormal <- createDataPartition(1:length(distribuicaonormal), p=.7) # passamos o tamanho do vetor e o parâmetro de divisão

treinoDistNormal <- distribuicaonormal[unlist(particaoDistNormal)] # criamos uma partição para treinar os dados, usando a partição anterior. Atenção: o comando unlist é muito usado para transformar uma lista num vetor

testeDistNormal <- distribuicaonormal[- unlist(particaoDistNormal)] 


# Calculando com o R


hist(distribuicaonormal)


centraldistribuicaonormal <- distribuicaonormal - mean(distribuicaonormal)

hist(centraldistribuicaonormal)


round(centraldistribuicaonormal, 0) # arredonda o vetor para inteiros

ceiling(centraldistribuicaonormal) # arredonda para cima

floor(centraldistribuicaonormal) # arredonda para baixo



# também podemos usar funções estatísticas no R

# média
mean(centraldistribuicaonormal)


# mediana
median(centraldistribuicaonormal)


# desvio padrão
sd(centraldistribuicaonormal)


# variância
var(centraldistribuicaonormal)

## Indexação 

library(poliscidata)

?nes

banco <- nes

banco$obama_therm[1]

banco$obama_therm[c(1:10, 15)]

#data.frames

banco$obama_therm

banco[ , 1]

banco[1:10, 1: 4]

banco[  , 'obama_therm', drop = FALSE]

banco[[1]][1]

which(banco$obama_therm <= 50)


## Criando funções

centralizacao <- function(x) {
  x <- x - mean(x)
  return(x)
}

centralizacao(banco$obama_therm)

centralizacao <- function(x) {
  x <- x - mean(x)
}

centralizacao(banco$obama_therm)
centroTeste <- centralizacao(banco$obama_therm)
