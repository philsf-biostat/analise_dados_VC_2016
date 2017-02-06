# input -------------------------------------------------------------------
rm(list = ls()) ## clean start

library(data.table)
dados <- read.csv2("../2017-01-31_TVP.csv", na.strings = "", encoding = 'UTF-8')
dados <- as.data.table(dados)
N.orig <- dim(dados)[1]

# processamento -----------------------------------------------------------

## Datas
dados$Data.Exame <- as.Date(dados$Data.Exame, "%d/%m/%Y")
dados$Data.Cirurgia <- as.Date(dados$Data.Cirurgia, "%d/%m/%Y")
dados$Data.Atendimento <- as.Date(dados$Data.Atendimento, "%d/%m/%Y")
dados$Nascimento <- as.Date(dados$Nascimento, "%d/%m/%Y")

# Ordenar dados por Data.Exame
setkey(dados, Data.Exame)

# Fatores
dados$Prontuario <- ordered(dados$Prontuario)
# dados <- dados[-c(1)] # Remover Prontuario
dados$Ano <- ordered(dados$Ano)

# IMC
dados$IMC <- dados$Peso/(dados$Altura^2)

## Idade
dados$Idade <- apply(dados,1,function(x) { length(seq.Date( as.Date(x['Nascimento']), as.Date(x['Data.Exame']), by = 'years')) } )

# Categorizar dados numéricos
dados$Faixa.Etaria <- cut(dados$Idade, c(0,65,Inf), right = F, labels = c("< 65 anos", ">= 65 anos"), ordered_result = T)
dados$Obesidade <- cut(dados$IMC, c(0,30, Inf), right = F, labels = c("NÃO", "SIM"))

# Número de medicamentos usados (fator)
dados$Numero.Medicamentos <- apply(dados[,list(Dabigatrana, Enoxaparina, Rivaroxabana, Warfarina)], 1, function(x) {x <- x == "SIM"; sum(x, na.rm = T)} )
dados$Numero.Medicamentos <- ordered(dados$Numero.Medicamentos)

# Número de comorbidades estudadas (fator)
dados$Numero.Comorbidades <- apply(dados[,list(Artrite.Reumatoide, AVC, Cardiopatia, Doenca.Reumatica, DM, HAS, Obesidade)], 1, function(x) {x <- x == "SIM"; sum(x, na.rm = T)} )
dados$Numero.Comorbidades <- ordered(dados$Numero.Comorbidades)

# colunas não utilizadass
dados[, c("Paciente",
          "Cirurgia",
          "Finalidade.Medicamentos",
          "OUTRAS",
          "Tempo",
          "Tipo.Atendimento",
          "Data.Atendimento",
          "Data.Cirurgia",
          "TEP",
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

pacientes.negativos <- dados[MIE.AGUDA == "NÃO" & MID.AGUDA == "NÃO" & MID.SUBAGUDA  == "NÃO" & MIE.SUBAGUDA == "NÃO" & MIE.ANTIGO == "NÃO" & MID.ANTIGO == "NÃO" & MIE.RECANALIZACAO == "NÃO" & MID.RECANALIZACAO == "NÃO" ]
dados <- dados[MIE.AGUDA == "SIM" | MID.AGUDA == "SIM" | MID.SUBAGUDA  == "SIM" | MIE.SUBAGUDA == "SIM" | MIE.ANTIGO == "SIM" | MID.ANTIGO == "SIM" | MIE.RECANALIZACAO == "SIM" | MID.RECANALIZACAO == "SIM" ]

# Pacientes duplicados (considerar apenas primeira ocorrência)
Pront.dup <- table(dados$Prontuario)
Pront.dup <- Pront.dup[Pront.dup > 1]
N.dup <- sum(Pront.dup) - length(Pront.dup)
dados <- dados[!duplicated(dados[,1]),]

# N final do estudo
N.final <- dim(dados)[1]

# barplot customizado
source("scripts/mybarplot.R")
