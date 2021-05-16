library(data.table)

vdemEndereco <- 'https://www.v-dem.net/en/data/data/v-dem-dataset-v111/#'

# extração direta via read.csv
system.time(extracao1 <- read.csv2(vdemEndereco))

# extração via amostragem com read.csv

# ler apenas as primeiras 20 linhas
amostra1 <- read.csv2(vdemEndereco , nrows=20)  

amostra1Classes <- sapply(amostra1, class) 

# fazemos a leitura passando as classes de antemão, a partir da amostra
system.time(extracao2 <- data.frame(read.csv2("https://www.v-dem.net/en/data/data/v-dem-dataset-v111/#", colClasses=amostra1Classes) ) )  

# extração via função fread, que já faz amostragem automaticamente
system.time(extracao3 <- fread(vdemEndereco))