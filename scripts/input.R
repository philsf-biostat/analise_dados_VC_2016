dados <- read.table("dataset/vc-dados.dat")

dados <- dados[-c(2,5)] # Remover Nome e Cirurgia

dados$Prontuario <- factor(dados$Prontuario)
dados$ANO <- factor(dados$ANO)
# dados$IMC <- dados$Peso/(dados$Altura^2)

str(dados)
summary(dados)

# attach(dados)
# 
# detach(dados)
# rm(dados)
