source("scripts/input.R")
library(tableone)

## Comorbidades por Gênero ####
ar.genero <- with(dados, table(Genero, Artrite.Reumatoide))
avc.genero <- with(dados, table(Genero, AVC))
cardio.genero <- with(dados, table(Genero, Cardiopatia))
dm.genero <- with(dados, table(Genero, DM))
dr.genero <- with(dados, table(Genero, Doenca.Reumatica))
has.genero <- with(dados, table(Genero, HAS))
obesidade.genero <- with(dados, table(Genero, Obesidade))

## Comorbidades por Idade.cat ####
ar.idade <- with(dados, table(Idade.cat, Artrite.Reumatoide))
avc.idade <- with(dados, table(Idade.cat, AVC))
cardio.idade <- with(dados, table(Idade.cat, Cardiopatia))
dm.idade <- with(dados, table(Idade.cat, DM))
dr.idade <- with(dados, table(Idade.cat, Doenca.Reumatica))
has.idade <- with(dados, table(Idade.cat, HAS))
obesidade.idade <- with(dados, table(Idade.cat, Obesidade))

## tabelas tableone ####
vars <-  c("Genero", "Idade", "Idade.cat", "Altura", "Peso", "IMC", "Tipo.Atendimento", "TEP", "SPT", "TVP.PREVIA")
tabela1 <- CreateTableOne(data = dados, vars = vars)
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
