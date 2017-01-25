source("scripts/input.R")
library(tableone)
vars <-  c("Genero", "Idade", "Idade.cat", "Altura", "Peso", "IMC", "Obeso", "Tipo.Atendimento", "TEP", "SPT", "TVP.PREVIA")
tabela1 <- CreateTableOne(data = dados, vars = vars)
rm(vars)

vars <- c("Profilaxia", "Dabigatrana", "Enoxaparina", "Rivaroxabana", "Warfarina")
medicamentos <- CreateTableOne(data = dados, vars = vars)
medicamentos.Genero <- CreateTableOne(data = dados, vars = vars, strata = "Genero")
# medicamentos.IMC <- CreateTableOne(data = dados, vars = vars)
# medicamentos.Idade <- CreateTableOne(data = dados, vars = vars)
rm(vars)

vars <- c("Artrite.Reumatoide", "AVC", "Cardiopatia", "DM", "Doenca.Reumatica", "HAS")
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
