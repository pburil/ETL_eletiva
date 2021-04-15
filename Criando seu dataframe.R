install.packages("eeptools")
library(eeptools)

## Criando um data.frame

# Vetor com nomes dos campeões do campeonato pernambucano a partir dos anos 2000

Campeoes <- c("Sport", "Náutico", "Náutico", "Sport", "Náutico", "Santa Cruz", "Sport", "Sport", "Sport", "Sport", "Sport", "Santa Cruz", "Santa Cruz", "Santa Cruz", "Sport", "Santa Cruz", "Santa Cruz", "Sport", "Náutico", "Sport", "Salgueiro")

# Vetor com os anos dos campeonatos 

Anos <- as.Date(c("2000-03-18", "2001-03-27", "2002-03-16", "2003-04-20", "2004-03-18", "2005-04-18", "2006-03-17", "2007-03-18", "2008-03-23", "2009-03-27", "2010-03-29", "2011-04-03", "2012-03-17", "2013-04-13", "2014-03-18", "2015-04-11", "2016-03-15", "2017-04-12", "2018-03-15", "2019-03-08", "2020-04-06"))

#Vetor tempo do campeonato

Tempo <- round(age_calc(Anos, units = "years")) 

## Data.fame com base nos vetores

listaCampeoes <- data.frame(Campeões = Campeoes,
                            AnoEmQueFoiCampeão = Anos,
                            TempodoTítulo = Tempo)