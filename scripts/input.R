# input -------------------------------------------------------------------

dados <- read.csv2("../2016-11-10_TVP.csv", na.strings = "")

# dados não utilizados
dados <- dados[-c(2, 15)] # Remover Nome e Cirurgia

# exclusão ----------------------------------------------------------------

# Pacientes que não tem informação completa de profilaxia
dados <- dados[complete.cases(dados[c("Rivoraxabana","Dabigatrana", "Enoxaparina", "Warfarina")]),]

# Pacientes duplicados (considerar apenas primeira ocorrência)

# inclusão ----------------------------------------------------------------

## Descartar pacientes que não fizeram uso de profilaxia
dados <- dados[!(dados$Dabigatrana == "NÃO" & dados$Enoxaparina == "NÃO" & dados$Rivoraxabana == "NÃO" & dados$Warfarina == "NÃO"),]

# processamento -----------------------------------------------------------

## Datas
dados$Data.Exame <- as.Date(dados$Data.Exame, "%d/%m/%Y")
dados$Data.Cirurgia <- as.Date(dados$Data.Cirurgia, "%d/%m/%Y")
dados$Data.Atendimento <- as.Date(dados$Data.Atendimento, "%d/%m/%Y")
dados$Nascimento <- as.Date(dados$Nascimento, "%d/%m/%Y")

# Fatores
dados$Prontuario <- ordered(dados$Prontuario)
# dados <- dados[-c(1)] # Remover Prontuario
dados$Ano <- ordered(dados$Ano)

# IMC
dados$IMC <- dados$Peso/(dados$Altura^2)

## Idade
# dados$Idade

str(dados)
summary(dados)

# attach(dados)
# 
# detach(dados)
# rm(dados)
