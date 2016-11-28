source("scripts/input.R")
library(tableone)
vars <-  c("Sexo", "Idade", "Altura", "Peso", "IMC", "Tipo.Atendimento", "TEP", "SPT", "TVP.PREVIA")
tabela1 <- CreateTableOne(data = dados, vars = vars)
rm(vars)

vars <- c("Dabigatrana", "Enoxaparina", "Rivoraxabana", "Warfarina")
medicamentos <- CreateTableOne(data = dados, vars = vars)
medicamentos.Sexo <- CreateTableOne(data = dados, vars = vars, strata = "Sexo")
# medicamentos.IMC <- CreateTableOne(data = dados, vars = vars)
# medicamentos.Idade <- CreateTableOne(data = dados, vars = vars)
rm(vars)

vars <- c("Artrite.Reumatoide", "AVC", "Cardiopatia", "DM", "Doenca.Reumatica", "HAS", "OUTRAS")
comorbidades <- CreateTableOne(data = dados, vars = vars)
rm(vars)

centros <- CreateCatTable(data = dados, "Grupo")
centros.enoxa <- CreateCatTable(data = dados, vars = "Grupo", strata = "Enoxaparina")

# tabela0 <- CreateTableOne(data = dados)
# print(tabela0, showAllLevels = T)

# print(tabela1, showAllLevels = T)
# print(medicamentos, showAllLevels = T)
# print(comorbidades, showAllLevels = T)
# print(centros, showAllLevels = T)
