# carrega a base de snistros de transito do site da PCR
sinistrosRecife2020Raw <- read.csv2('http://dados.recife.pe.gov.br/dataset/44087d2d-73b5-4ab3-9bd8-78da7436eed1/resource/fc1c8460-0406-4fff-b51a-e79205d1f1ab/download/acidentes_2020-novo.csv', sep = ';', encoding = 'UTF-8')

sinistrosRecife2021Raw <- read.csv2('http://dados.recife.pe.gov.br/dataset/44087d2d-73b5-4ab3-9bd8-78da7436eed1/resource/2caa8f41-ccd9-4ea5-906d-f66017d6e107/download/acidentes_2021-jan.csv', sep = ';', encoding = 'UTF-8')

sinistrosRecife2019Raw <- read.csv2('http://dados.recife.pe.gov.br/dataset/44087d2d-73b5-4ab3-9bd8-78da7436eed1/resource/3531bafe-d47d-415e-b154-a881081ac76c/download/acidentes-2019.csv', sep = ';', encoding = 'UTF-8')

# junta as bases de dados com comando rbind (juntas por linhas)

sinistrosRecifeRaw1 <- rbind(sinistrosRecife2020Raw, sinistrosRecife2021Raw)

sinistrosRecife2019Raw <- sinistrosRecife2019Raw[  , -c(10, 11, 12)]

names(sinistrosRecife2019Raw)[1] <- "data"

sinistrosRecife <- rbind(sinistrosRecife2019Raw, sinistrosRecifeRaw1)

sinistrosRecife$sentido_via <- as.factor(sinistrosRecife$sentido_via)

naZero <- function(x) {
  x <- ifelse(is.na(x), 0, x)
}

#### Staging area e uso de memória

ls() # lista todos os objetos no R

for (itm in ls()) { 
  print(formatC(c(itm, object.size(get(itm))), 
                format="d", 
                width=30), 
        quote=F)
}

## O que ocupa mais espaço é o sinistrosRecife2019Raw e o sinistrosRecife em seguida.

rm(list = c('sinistrosRecife2020Raw', 'sinistrosRecife2021Raw', 'sinistrosRecifeRaw1', 'sinistrosRecife2019Raw'))

ls()
