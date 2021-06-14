library(data.table)
library(funModeling)
library(tidyverse)
library(dplyr)
library(data.table)
library(plotly)

url <- "https://raw.githubusercontent.com/pburil/ClustersClimateChangePerceptionBRA/main/percepcao_climatica_codigos.csv"

download.file(url, "percepcao_climatica_codigos.csv", mode = "wb")

banco_codigos <- read.csv("percepcao_climatica_codigos.csv", sep = ',', encoding = "UTF-8")

## Vendo os outliers (como tem poucas regiões, não ficou tão bom)
banco_codigos_regiao <- banco_codigos %>% 
  count(REGIAO, sort = T, name = 'entrevistados') %>% 
    mutate(casos2 = sqrt(entrevistados), casosLog = log10(entrevistados))

plot_ly(y = banco_codigos_regiao$casos2, type = "box", text = banco_codigos_regiao$REGIAO, boxpoints = "all", jitter = 0.3)

