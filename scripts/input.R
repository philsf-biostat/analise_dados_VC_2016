# input -------------------------------------------------------------------
rm(list = ls()) ## clean start

library(data.table)
dados <- read.csv2("../2017-01-29_TVP.csv", na.strings = "")
dados <- as.data.table(dados)
N.orig <- dim(dados)[1]

# dados não utilizados
dados[, c("Paciente",
          "Cirurgia",
          "OUTRAS",
          "Tempo",
          "Tipo.Atendimento",
          "Data.Atendimento",
          "Data.Cirurgia",
          "TVP.PREVIA"
          ) := NULL] # Colunas removidas

# # Usar "Genero" ao invés de "Sexo"
# colnames(dados)[colnames(dados) == 'Sexo'] <- 'Genero'

# inclusão ----------------------------------------------------------------

## Descartar pacientes que não fizeram uso de profilaxia
# profilaxia.neg <- dim(dados[(dados$Dabigatrana == "NÃO" & dados$Enoxaparina == "NÃO" & dados$Rivaroxabana == "NÃO" & dados$Warfarina == "NÃO"),])[1]
# dados <- dados[!(dados$Dabigatrana == "NÃO" & dados$Enoxaparina == "NÃO" & dados$Rivaroxabana == "NÃO" & dados$Warfarina == "NÃO"),]

# exclusão ----------------------------------------------------------------

# Pacientes que não tem informação completa de profilaxia
# profilaxia.incompleta <- dim(dados[!complete.cases(dados[c("Rivaroxabana","Dabigatrana", "Enoxaparina", "Warfarina")]),])[1]
# dados <- dados[complete.cases(dados[c("Rivaroxabana","Dabigatrana", "Enoxaparina", "Warfarina")]),]

# Pacientes duplicados (considerar apenas primeira ocorrência)
Pront.dup <- table(dados[1])
Pront.dup <- Pront.dup[Pront.dup>1]
N.dup <- sum(Pront.dup)- length(Pront.dup)
dados <- dados[!duplicated(dados[,1]),]

# processamento -----------------------------------------------------------

N.final <- dim(dados)[1]
## Datas
dados$Data.Exame <- as.Date(dados$Data.Exame, "%d/%m/%Y")
# dados$Data.Cirurgia <- as.Date(dados$Data.Cirurgia, "%d/%m/%Y")
# dados$Data.Atendimento <- as.Date(dados$Data.Atendimento, "%d/%m/%Y")
dados$Nascimento <- as.Date(dados$Nascimento, "%d/%m/%Y")

# Fatores
dados$Prontuario <- ordered(dados$Prontuario)
# dados <- dados[-c(1)] # Remover Prontuario
dados$Ano <- ordered(dados$Ano)

# IMC
dados$IMC <- dados$Peso/(dados$Altura^2)

## Idade
dados$Idade <- apply(dados,1,function(x) { length(seq.Date( as.Date(x['Nascimento']), as.Date(x['Data.Exame']), by='years')) } )

# Número de medicamentos usados (fator)
dados$Numero.Medicamentos <- apply(dados[,list(Dabigatrana, Enoxaparina, Rivaroxabana, Warfarina)], 1, function(x) {x <- x == "SIM"; sum(x, na.rm = T)} )
dados$Numero.Medicamentos <- ordered(dados$Numero.Medicamentos)

# Categorizar dados numéricos
dados$Idade.cat <- dados$Idade >= 65
dados$Idade.cat <- ordered(dados$Idade.cat, labels = c("< 65 anos", ">= 65 anos"))
dados$Obesidade <- dados$IMC >= 30
dados$Obesidade <- factor(dados$Obesidade, labels = c("NÃO", "SIM"))
