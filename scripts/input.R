dados <- read.csv2("../2016-11-10_TVP.csv", na.strings = "")

dados <- dados[complete.cases(dados[c("Rivoraxabana","Dabigatrana", "Enoxaparina", "Warfarina")]),]

dados <- dados[-c(2, 15)] # Remover Nome e Cirurgia

dados[dados$Dabigatrana == "NÃO" & dados$Enoxaparina == "NÃO" & dados$Rivoraxabana == "NÃO" & dados$Warfarina == "NÃO", c(16:19)]

dados$Data.Exame <- as.Date(dados$Data.Exame, "%d/%m/%Y")
dados$Data.Cirurgia <- as.Date(dados$Data.Cirurgia, "%d/%m/%Y")
dados$Data.Atendimento <- as.Date(dados$Data.Atendimento, "%d/%m/%Y")
dados$Nascimento <- as.Date(dados$Nascimento, "%d/%m/%Y")

dados$Prontuario <- factor(dados$Prontuario)
dados <- dados[-c(1)] # Remover Prontuario
dados$Ano <- ordered(dados$Ano)
dados$IMC <- dados$Peso/(dados$Altura^2)

str(dados)
summary(dados)

# attach(dados)
# 
# detach(dados)
# rm(dados)
