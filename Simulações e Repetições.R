install.packages("devtools")

library(devtools)
library(rlang)

devtools::install_github("vdeminstitute/vdemdata")

vdemdata::vdem

vdem <- vdemdata::vdem

## Distribuição com a variável normal v2x_polyarchy (to what extent is the ideal of electoral democracy in its fullets sense achieved?)
vdem$v2x_polyarchy

distribuicaonormal <- rnorm(1000, vdem$v2x_polyarchy)

summary(distribuicaonormal)


##Distribuição binomial com a probabilidade de a moeda cair cara ou coroa com a probabilidade de cada teste de 0.5

distribuicaobinomial <- rbinom(100, 1, 0.5)


# repetições
classeSimulacao <- c(rep("Cara", length(distribuicaobinomial)/2), rep("Coroa", length(distribuicaobinomial)/2))

# sequências

indexSimulacao <- seq(1, length(distribuicaonormal)) 


