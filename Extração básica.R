# arquivos de texto com read.table

minhas_palavras <- read.table("https://archive.ics.uci.edu/ml/machine-learning-databases/bag-of-words/vocab.enron.txt")

## Arquivo .csv

nomes_por_genero <- read.csv2("https://archive.ics.uci.edu/ml/machine-learning-databases/00591/name_gender_dataset.csv", sep = ',')

#arquivos json

install.packages('rjson')

library(rjson)

RevisaoArtigos <- fromJSON(file = "https://archive.ics.uci.edu/ml/machine-learning-databases/00410/reviews.json")


#Arquivos de excel

library(readxl)

url <- "https://ufob.edu.br/acesso-a-informacao/dados-abertos/api/2019/execucao-orcamentaria-2019-1.xlsx"

download.file(url, "execorcamentaria", mode = "wb")

execorçamentaria <- read_excel('execorçamentaria') 


