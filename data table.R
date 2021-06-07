library(data.table)
library(tidyverse)
library(dplyr)
library(poliscidata)

banco <- world

bancoDT <- banco %>% setDT()
class(bancoDT)

bancoDT[ , lm(formula = gini10 ~ dem_score14 + hdi + lifeex_f)]

bancoDT[ , .(dem_score14 = mean(dem_score14, na.rm = T)), by = dem_level4]

