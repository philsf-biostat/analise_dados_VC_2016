source("scripts/input.R")
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
idade.tab <- table(dados$Idade.cat)
obesidade.tab <- table(dados$Obesidade)
CAE.tab <- sort(table(dados$CAE), decreasing = T)
CAE.alfa <- table(dados$CAE)

## Comorbidades por Gênero ####
ar.genero <- with(dados, table(Genero, Artrite.Reumatoide))
avc.genero <- with(dados, table(Genero, AVC))
cardio.genero <- with(dados, table(Genero, Cardiopatia))
dm.genero <- with(dados, table(Genero, DM))
dr.genero <- with(dados, table(Genero, Doenca.Reumatica))
has.genero <- with(dados, table(Genero, HAS))
obesidade.genero <- with(dados, table(Genero, Obesidade))
vars <- c("Artrite.Reumatoide", "AVC", "Cardiopatia", "DM", "Doenca.Reumatica", "HAS", "Obesidade")
comorbidades.genero <- CreateTableOne(data = dados, vars = vars, strata = "Genero")

## Comorbidades por Idade.cat ####
ar.idade <- with(dados, table(Idade.cat, Artrite.Reumatoide))
avc.idade <- with(dados, table(Idade.cat, AVC))
cardio.idade <- with(dados, table(Idade.cat, Cardiopatia))
dm.idade <- with(dados, table(Idade.cat, DM))
dr.idade <- with(dados, table(Idade.cat, Doenca.Reumatica))
has.idade <- with(dados, table(Idade.cat, HAS))
obesidade.idade <- with(dados, table(Idade.cat, Obesidade))
comorbidades.idade <- CreateTableOne(data = dados, vars = vars, strata = "Idade.cat")

## Número de medicamentos por Gênero e Idade.cat ####
nummeds.genero <- with(dados, table(Genero, Numero.Medicamentos))
nummeds.idade <- with(dados, table(Idade.cat, Numero.Medicamentos))

## Finalidade dos Medicamentos (comorbidades, SPT e TEP)
finalidade.spt <- with(dados, table(Finalidade.Medicamentos, SPT))
finalidade.tep <- with(dados, table(Finalidade.Medicamentos, TEP))
finalidade_meds <- CreateCatTable(vars = c("SPT", "TEP"), strata = "Finalidade.Medicamentos", data = dados)

## tabelas tableone ####
vars <- c("Numero.Medicamentos", "Dabigatrana", "Enoxaparina", "Rivaroxabana", "Warfarina")
medicamentos <- CreateTableOne(data = dados, vars = vars)
medicamentos.Genero <- CreateTableOne(data = dados, vars = vars, strata = "Genero")
medicamentos.Idade <- CreateTableOne(data = dados, vars = vars, strata = "Idade.cat")
rm(vars)

vars <- c("Artrite.Reumatoide", "Doenca.Reumatica", "AVC", "Cardiopatia", "DM", "HAS", "Obesidade")
comorbidades <- CreateTableOne(data = dados, vars = vars)
rm(vars)

centros <- CreateCatTable(data = dados, "CAE")
# centros.dabi <- CreateCatTable(data = dados, vars = "CAE", strata = "Dabigatrana")
# centros.enoxa <- CreateCatTable(data = dados, vars = "CAE", strata = "Enoxaparina")
# centros.riva <- CreateCatTable(data = dados, vars = "CAE", strata = "Rivaroxabana")
# centros.warfa <- CreateCatTable(data = dados, vars = "CAE", strata = "Warfarina")

centro.tep <- CreateCatTable(data = dados, vars = "CAE", strata = "TEP")
centro.spt <- CreateCatTable(data = dados, vars = "CAE", strata = "SPT")
