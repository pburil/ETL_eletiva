library(data.table)
library(funModeling)
library(tidyverse)

url <- "https://raw.githubusercontent.com/pburil/ClustersClimateChangePerceptionBRA/main/percepcao_climatica_codigos.csv"

download.file(url, "percepcao_climatica_codigos.csv", mode = "wb")

banco_codigos <- read.csv("percepcao_climatica_codigos.csv", sep = ',', encoding = "UTF-8")

## Shadow Matrix da nossa base de covid19 com adaptações

banco_na <- as.data.frame(abs(is.na(banco_codigos))) # cria a matriz sombra da base de covid19

banco_na <- banco_na[which(sapply(banco_na, sd) > 0)] # mantém variáveis com NA
round(cor(banco_na), 3) # calcula correlações

# modificação já que vão temos uma base numérica
banco_na <- cbind(banco_na, REGIAO = banco_codigos$REGIAO) # trazemos uma variável de interesse (municípios) de volta pro frame


banco_final <- banco_na %>% group_by(REGIAO) %>% summarise(across(everything(), list(sum))) # sumarizamos e observamos se os NA se concentram nos municípios com mais casos