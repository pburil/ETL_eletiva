library(dplyr)
library(tidyverse)
install.packages("validate")
library(validate)
library(funModeling)

## importamos o Pandemic Democratic Violations Index (PanDem V3) ##


url <- "https://raw.githubusercontent.com/vdeminstitute/pandem/master/csv_files/PanDem_cs_V5.1.csv" 

download.file(url, "pandem.csv", mode = "wb") 

pandem <- read_csv("pandem.csv") 

pandem <- pandem %>%
  rename(Country = country_name) 

## Também incluiremos o Índice de Desenvolvimento Humano ## 


url2 <- "https://raw.githubusercontent.com/pburil/analisededados/master/idh.csv"

download.file(url2, "idh.csv", mode = "wb")

idh <- read_csv("idh.csv")

idh <- idh %>%
  rename(IDH = Score)

idh$IDH <- as.numeric(idh$IDH)


## Juntamos os bancos de dados com a função left_join ## 


banco_unido <- left_join(idh, pandem) 

## Validação

validacao_pandemIDH <- validator(!is.na(IDH),
                                      !is.na(country),
                                      !is.na(Type1))

validacao_pandemIDH <- confront(banco_unido,
                                validacao_pandemIDH)

summary(validacao_pandemIDH)

plot(validacao_pandemIDH)
