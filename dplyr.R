library(dplyr)
library(poliscidata)
banco <- gss

glimpse(banco)

banco_novo <- banco %>%
  select(age, born, degree, sex, authoritarianism, polviews, pres08) %>%
  filter(born == "YES") %>%
  arrange(age) %>%
  mutate(ano_nascimento = 2012 - age,
         polviews  = recode(polviews,
                            ExtrmLib = "Extremely Liberal",
                            SlghtLib = "Slightly Liberal",
                            SlghtCons = "Slightly Conservative",
                            Conserv = "Conservative",
                            ExtremCons = "Extremely Conservative")) %>%
  rename(voto_presidencial = pres08)

banco_novo %>%
  count(degree)

banco_novo %>%
  count(degree, sort = T)

banco_novo %>%
  group_by(degree) %>%
  summarise(media = mean(authoritarianism, na.rm = TRUE), 
            mediana = median(authoritarianism, na.rm = TRUE), 
            minimo = min(authoritarianism, na.rm = TRUE),
            maximo = max(authoritarianism, na.rm = TRUE))




