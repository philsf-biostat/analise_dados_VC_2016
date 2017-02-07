source("scripts/input.R", encoding = 'UTF-8')
library(tableone)
vars <-  c("Idade", "Altura", "Peso", "IMC")
tabela1 <- CreateTableOne(data = dados, vars = vars, strata = "Genero")
tabela1$ContTable$F[,1:2] <- tabela1$ContTable$F[,1:2] - tabela1$ContTable$F[,2]
tabela1$ContTable$M[,1:2] <- tabela1$ContTable$M[,1:2] - tabela1$ContTable$M[,2]
tab1 <- as.data.frame(print(tabela1, printToggle = F, exact = T), stringsAsFactors = F)
tab1 <- cbind(tab1, n.F = c("n", tabela1$ContTable$F[,1]), n.M = c("n",tabela1$ContTable$M[,1]) )
tab1 <- tab1[c("n.F", "F", "n.M", "M", "p")]
rownames(tab1) <- c("", "Idade (média (DP)", "Altura (média (DP)", "Peso (média (DP)", "IMC (média (DP)" )
colnames(tab1) <- c("", "F", "", "M", "p")
tab1[1,c(2,4)] <- ""

tab2 <- t(rbind(
  N = dados[, lapply(.SD, function(x) sum(!is.na(x))), .SDcols = vars],
  dados[, lapply(.SD, mean, na.rm = T), .SDcols = vars],
  dados[, lapply(.SD, sd, na.rm = T), .SDcols = vars],
  dados[, lapply(.SD, median, na.rm = T), .SDcols = vars],
  dados[, lapply(.SD, IQR, na.rm = T), .SDcols = vars],
  dados[, lapply(.SD, min, na.rm = T), .SDcols = vars],
  dados[, lapply(.SD, max, na.rm = T), .SDcols = vars]
))
colnames(tab2) <- c("n", "Média", "DP", "Mediana", "AIQ", "Min", "Max")

## Tabelas de simples contagem
CAE.tab <- sort(table(dados$CAE), decreasing = T)
CAE.alfa <- table(dados$CAE)

## Comorbidades por Gênero ####
ar.genero <- with(dados, table(Genero, Artrite.Reumatoide))
ave.genero <- with(dados, table(Genero, AVE))
cardio.genero <- with(dados, table(Genero, Cardiopatia))
dm.genero <- with(dados, table(Genero, DM))
dr.genero <- with(dados, table(Genero, Doenca.Reumatica))
has.genero <- with(dados, table(Genero, HAS))
obesidade.genero <- with(dados, table(Genero, Obesidade))
vars <- c("Numero.Comorbidades", "Artrite.Reumatoide", "AVE", "Cardiopatia", "DM", "Doenca.Reumatica", "HAS", "Obesidade")
comorbidades.genero <- CreateTableOne(data = dados, vars = vars, strata = "Genero")

## Comorbidades por Faixa.Etaria ####
ar.idade <- with(dados, table(Faixa.Etaria, Artrite.Reumatoide))
ave.idade <- with(dados, table(Faixa.Etaria, AVE))
cardio.idade <- with(dados, table(Faixa.Etaria, Cardiopatia))
dm.idade <- with(dados, table(Faixa.Etaria, DM))
dr.idade <- with(dados, table(Faixa.Etaria, Doenca.Reumatica))
has.idade <- with(dados, table(Faixa.Etaria, HAS))
obesidade.idade <- with(dados, table(Faixa.Etaria, Obesidade))
comorbidades.idade <- CreateTableOne(data = dados, vars = vars, strata = "Faixa.Etaria")

## Número de medicamentos por Gênero e Faixa.Etaria ####
nummeds.genero <- with(dados, table(Genero, Numero.Medicamentos))
nummeds.idade <- with(dados, table(Faixa.Etaria, Numero.Medicamentos))

## tabelas tableone ####
vars <- c("Numero.Medicamentos", "Dabigatrana", "Enoxaparina", "Rivaroxabana", "Warfarina")
medicamentos <- CreateTableOne(data = dados, vars = vars)
medicamentos.Genero <- CreateTableOne(data = dados, vars = vars, strata = "Genero")
medicamentos.Idade <- CreateTableOne(data = dados, vars = vars, strata = "Faixa.Etaria")
rm(vars)

vars <- c("Numero.Comorbidades", "Artrite.Reumatoide", "Doenca.Reumatica", "AVE", "Cardiopatia", "DM", "HAS", "Obesidade")
comorbidades <- CreateTableOne(data = dados, vars = vars)
rm(vars)

## Número de comorbidades por Gênero e Faixa.Etaria ####
numcomorb.genero <- with(dados, table(Genero, Numero.Comorbidades))
numcomorb.idade <- with(dados, table(Faixa.Etaria, Numero.Comorbidades))

## CAEs ####
centros <- CreateCatTable(data = dados, "CAE")
centro.spt <- CreateCatTable(data = dados, vars = "CAE", strata = "SPT")
