direcoes <- c("Sul", "Norte", "Leste", "Oeste")

factor(direcoes)

recode <- c("S" = "Sul", "N" = "Norte", "L" = "Leste", "O" = "Oeste")

(direcoes <- factor(direcoes, levels = recode, labels = names(recode)))

as.numeric(direcoes)

temperatura <- c(28, 25, 23, 18)

(direcoes <- reorder(direcoes, temperatura))

