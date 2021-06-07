install.packages("ade4")
library(ade4)
install.packages("arules")
library(arules)
library(forcats)
library(readxl)
library(dplyr)
library(tidyr)
library(tidyverse)

url <- "https://raw.githubusercontent.com/OHI-Science/ohi-global/draft/yearly_results/global2020/Results/data/index_scores_wide_all_years.csv"

download.file(url, "banco.csv", mode = "wb")

banco <- read_csv("banco.csv")

banco <- banco %>%
  rename(Country = region_name, OHI = average) 

str(banco)

# filtro por tipo de dado

numBanco <- unlist(lapply(banco, is.numeric))  
numBanco <- banco[ , numBanco]
str(numBanco)

## Discretização 

numBanco$OHI <- discretize(numBanco$OHI, method = "interval", breaks = 3, labels = c("pouco", 'médio', 'muito'))

# forcats - usando tidyverse para fatores


fct_lump(numBanco$OHI, n = 1) 
