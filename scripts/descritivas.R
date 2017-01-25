source("scripts/input.R")
library(tableone)
vars <-  c("Idade", "Altura", "Peso", "IMC")
tabela1 <- CreateTableOne(data = dados, vars = vars, strata = "Genero")
tabela1$ContTable$F[,1:2] <- tabela1$ContTable$F[,1:2] - tabela1$ContTable$F[,2]
tabela1$ContTable$M[,1:2] <- tabela1$ContTable$M[,1:2] - tabela1$ContTable$M[,2]
tab1 <- as.data.frame(print(tabela1, printToggle = F, exact = T))
tab1 <- cbind(tab1, n.F = c("n.F", tabela1$ContTable$F[,1]), n.M = c("n.M",tabela1$ContTable$M[,1]) )
tab1 <- tab1[c("n.F", "F", "n.M", "M", "p")]
rownames(tab1) <- c("", "Idade (média (DP)", "Altura (média (DP)", "Peso (média (DP)", "IMC (média (DP)" )
colnames(tab1) <- c("", "F", "", "M", "p")
rm(vars)

vars <- c("Profilaxia", "Dabigatrana", "Enoxaparina", "Rivaroxabana", "Warfarina")
medicamentos <- CreateTableOne(data = dados, vars = vars)
medicamentos.Genero <- CreateTableOne(data = dados, vars = vars, strata = "Genero")
# medicamentos.IMC <- CreateTableOne(data = dados, vars = vars)
# medicamentos.Idade <- CreateTableOne(data = dados, vars = vars)
rm(vars)

vars <- c("Artrite.Reumatoide", "AVC", "Cardiopatia", "DM", "Doenca.Reumatica", "HAS", "Obesidade")
comorbidades <- CreateTableOne(data = dados, vars = vars)
rm(vars)

centros <- CreateCatTable(data = dados, "Grupo")
centros.dabi <- CreateCatTable(data = dados, vars = "Grupo", strata = "Dabigatrana")
centros.enoxa <- CreateCatTable(data = dados, vars = "Grupo", strata = "Enoxaparina")
centros.riva <- CreateCatTable(data = dados, vars = "Grupo", strata = "Rivaroxabana")
centros.warfa <- CreateCatTable(data = dados, vars = "Grupo", strata = "Warfarina")

centro.tep <- CreateCatTable(data = dados, vars = "Grupo", strata = "TEP")
centro.spt <- CreateCatTable(data = dados, vars = "Grupo", strata = "SPT")
centro.tvpp <- CreateCatTable(data = dados, vars = "Grupo", strata = "TVP.PREVIA")

# tabela0 <- CreateTableOne(data = dados)
# print(tabela0, showAllLevels = T)

# print(tabela1, showAllLevels = T)
# print(medicamentos, showAllLevels = T)
# print(comorbidades, showAllLevels = T)
# print(centros, showAllLevels = T)
