# arquivos html

library(rvest)
library(dplyr)

# presidentes do Brasil

url <- "https://pt.wikipedia.org/wiki/Lista_de_presidentes_do_Brasil"

urlTables <- url %>% read_html %>% html_nodes("table")

urlLinks <- url %>% read_html %>% html_nodes("link")

presidentesBrasil <- as.data.frame(html_table(urlTables[1], header = TRUE, fill = TRUE)) %>%
  select(N., Presidente, periodo_e_duração = Período.do.mandato.duração.do.mandato., Partido, vice_presidente = Vice.presidente.s., Eleição) 
  
presidentesBrasil <- presidentesBrasil[-c(1), ]

