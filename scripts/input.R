# input -------------------------------------------------------------------

dados <- read.csv2("../2017-01-24_TVP.csv", na.strings = "")
N.orig <- dim(dados)[1]

# dados não utilizados
dados <- dados[-c(2, 15)] # Remover Nome e Cirurgia

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
dados$Idade <- apply(dados,1,function(x) { length(seq.Date( as.Date(x['Nascimento']), as.Date(x['Data.Exame']), by='years')) } )

# Profilaxia medicamentosa (logical)
dados$Dabigatrana <- dados$Dabigatrana == "SIM"
dados$Enoxaparina <- dados$Enoxaparina == "SIM"
dados$Rivaroxabana <- dados$Rivaroxabana == "SIM"
dados$Warfarina <- dados$Warfarina == "SIM"
dados$Profilaxia <- with(dados, Dabigatrana  | Enoxaparina | Rivaroxabana | Warfarina )
# print(summary(Profilaxia))

# Categorizar dados numéricos
dados$Idoso <- dados$Idade >= 65
dados$Idoso <- factor(dados$Idoso, labels = c("NÃO", "SIM"))
dados$Obeso <- dados$IMC >= 30
dados$Obeso <- factor(dados$Obeso, labels = c("NÃO", "SIM"))
