library(data.table)
library(poliscidata)


banco <- world


## imputação numérica
# preparação da base, colocando NA aleatórios
bancoDT <- banco %>% setDT() #copiar base world, usando a data.table

(bancoDTNAseed <- round(runif(10, 1, 50))) # criamos 10 valores aleatórios

(bancoDT$debt[bancoDTNAseed] <- NA) # imputamos NA nos valores aleatórios

# tendência central
library(Hmisc) # biblio que facilita imputação de tendência central
bancoDT$debt <- impute(bancoDT$debt, fun = mean) # média
bancoDT$debt <- impute(bancoDT$debt, fun = median) # mediana

is.imputed(bancoDT$debt) # teste se o valor foi imputado
table(is.imputed(bancoDT$debt)) # tabela de imputação por sim / não

# predição
bancoDT$debt[bancoDTNAseed] <- NA # recolocamos os NA
bancoNAIndex <- is.na(bancoDT$debt) # localizamos os NA

## Hot deck
# imputação aleatória
bancoDT$debt[bancoDTNAseed] <- NA # recolocamos os NA

(bancoDT$debt <- impute(bancoDT$debt, "random")) # fazemos a imputação aleatória

# imputação por instâncias
bancoDT$debt[bancoDTNAseed] <- NA # recolocamos os NA

install.packages("VIM")
library(VIM)
bancoDT2 <- kNN(bancoDT)
