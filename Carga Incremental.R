library(dplyr)

## Carrega base de dados original
sinistrosRecife2020Raw <- read.csv2('http://dados.recife.pe.gov.br/dataset/44087d2d-73b5-4ab3-9bd8-78da7436eed1/resource/fc1c8460-0406-4fff-b51a-e79205d1f1ab/download/acidentes_2020-novo.csv', sep = ';', encoding = 'UTF-8')



sinistrosRecife2021Raw <- read.csv2('http://dados.recife.pe.gov.br/dataset/44087d2d-73b5-4ab3-9bd8-78da7436eed1/resource/2caa8f41-ccd9-4ea5-906d-f66017d6e107/download/acidentes_2021-jan.csv', sep = ';', encoding = 'UTF-8')

## Compara usando a chave primaria

chavesinistrosRecife <- (!sinistrosRecife2020Raw$data %in% sinistrosRecife2021Raw$data)

# compara usando a chave substituta

# criar a chave substituta
sinistrosRecife2020Raw$chaveSubstituta = apply(sinistrosRecife2020Raw[, c(1,2, 5)], MARGIN = 1, FUN = function(i) paste(i, collapse = ""))

sinistrosRecife2021Raw$chaveSubstituta = apply(sinistrosRecife2021Raw[, c(1,2, 5)], MARGIN = 1, FUN = function(i) paste(i, collapse = ""))

# criar base de comparação

chavesinistrosRecife <- (!sinistrosRecife2020Raw$chaveSubstituta %in% sinistrosRecife2021Raw$chaveSubstituta)

# comparação linha a linha
setdiff(sinistrosRecife2021Raw, sinistrosRecife2020Raw)

# retorna vetor com incremento
sinistrosRecife2020Raw[chavesinistrosRecife,]

# junta base original e incremento
sinistrossegundadecada <- rbind(sinistrosRecife2020Raw, sinistrosRecife2020Raw[chavesinistrosRecife,])