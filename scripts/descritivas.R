library(tableone)
vars <-  c("Altura", "Peso", "IMC", "Tipo.Atendimento", "TVP", "TEP", "SPT", "TVP.PREVIA")
tabela1 <- CreateTableOne(data = dados, vars = vars)
rm(vars)

vars <- c("Rivoraxabana", "Dabigatrana", "Warfarina", "Enoxaparina")
medicamentos <- CreateTableOne(data = dados, vars = vars)
rm(vars)

vars <- c("HAS", "Doenca.Reumatica","Artrite.Reumatoide", "AVC", "DM", "Cardiopatia", "OUTRAS")
comorbidades <- CreateTableOne(data = dados, vars = vars)
rm(vars)

# tabela0 <- CreateTableOne(data = dados)
# print(tabela0, showAllLevels = T)

print(tabela1, showAllLevels = T)
print(medicamentos, showAllLevels = T)
print(comorbidades, showAllLevels = T)
