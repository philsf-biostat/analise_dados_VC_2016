dados <- read.csv2("../2016-11-01 TVP.csv", na.strings = "")

dados <- dados[-c(2,5)] # Remover Nome e Cirurgia

dados$Prontuario <- factor(dados$Prontuario)
dados <- dados[-c(1)] # Remover Prontuario
dados$ANO <- factor(dados$ANO)
dados$IMC <- dados$Peso/(dados$Altura^2)

str(dados)
summary(dados)

# attach(dados)
# 
# detach(dados)
# rm(dados)
