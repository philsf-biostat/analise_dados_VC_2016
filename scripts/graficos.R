source("scripts/mybarplot.R", encoding = "UTF-8")

# locale BR ---------------------------------------------------------------
suppressWarnings(Sys.setlocale("LC_NUMERIC", "pt_BR.UTF-8"))


# comorbidades ------------------------------------------------------------

png("graficos/comorbidades-genero.png", 700, 1400)
par(mfrow = c(4,2))
mybarplot(ar.genero, "AR", "Gênero")
mybarplot(ave.genero, "AVE", "Gênero")
mybarplot(cardio.genero, "Cardiopatia", "Gênero")
mybarplot(dm.genero, "DM", "Gênero")
mybarplot(dr.genero, "DR", "Gênero")
mybarplot(has.genero, "HAS", "Gênero")
mybarplot(obesidade.genero, "Obesidade", "Gênero")
mybarplot(numcomorb.genero, "Número de comorbidades", "Gênero")
dev.off()

png("graficos/comorbidades-idade.png", 700, 1400)
par(mfrow = c(4,2))
mybarplot(ar.idade, "AR", "Faixa etária")
mybarplot(ave.idade, "AVE", "Faixa etária")
mybarplot(cardio.idade, "Cardiopatia", "Faixa etária")
mybarplot(dm.idade, "DM", "Faixa etária")
mybarplot(dr.idade, "DR", "Faixa etária")
mybarplot(has.idade, "HAS", "Faixa etária")
mybarplot(obesidade.idade, "Obesidade", "Faixa etária")
mybarplot(numcomorb.idade, "Número de comorbidades", "Faixa etária")
dev.off()

png("graficos/nummeds-genero.png", 700, 700)
mybarplot(nummeds.genero, "Número de medicamentos", "Gênero")
dev.off()

# número de meds ----------------------------------------------------------

png("graficos/nummeds-idade.png", 700, 700)
mybarplot(nummeds.idade, "Número de medicamentos", "Faixa etária")
dev.off()

# CAEs --------------------------------------------------------------------

png("graficos/centros.png", 700, 700)
par(mar = c(7, 4, 4, 2) + 0.2) #add room for the rotated labels
cp <- barplot(CAE.tab, axes = FALSE, axisnames = FALSE, ylab = "Número de pacientes", col = rainbow(length((rownames(CAE.alfa))), .6, .6), ylim = c(0 , 1.3*max(CAE.tab)))
text(cp, par("usr")[3]-5, labels = rownames(CAE.tab), srt = 60, adj = c(1,1), xpd = TRUE)
axis(2)
title("Casos por Centro de Atenção Especializada")
dev.off()

png("graficos/centros_o_alfabetica.png", 700, 700)
par(mar = c(7, 4, 4, 2) + 0.2) #add room for the rotated labels
cp <- barplot(CAE.alfa, axes = FALSE, axisnames = FALSE, ylab = "Número de pacientes", col = rev(rainbow(length((rownames(CAE.alfa))), .6, .6)), ylim = c(0 , 1.3*max(CAE.alfa)))
text(cp, par("usr")[3]-5, labels = rownames(CAE.alfa), srt = 60, adj = c(1,1), xpd = TRUE)
axis(2)
title("Casos por Centro de Atenção Especializada")
dev.off()

png("graficos/trombos.png", 700, 700)
par(mfrow = c(2,2))
with(dados, mybarplot(table(Trombo.Agudo), "Trombo agudo" ))
with(dados, mybarplot(table(Trombo.Subagudo), "Trombo subagudo" ))
with(dados, mybarplot(table(Trombo.Antigo), "Trombo antigo" ))
with(dados, mybarplot(table(Trombo.Recanalizado), "Trombo recanalizado" ))
dev.off()

# descritivas simples -----------------------------------------------------

t.med <- cbind(
  Dabigatrana=medicamentos$CatTable$Overall$Dabigatrana$freq,
  Enoxaparina=medicamentos$CatTable$Overall$Enoxaparina$freq,
  Rivaroxabana=medicamentos$CatTable$Overall$Rivaroxabana$freq,
  Varfarina=medicamentos$CatTable$Overall$Varfarina$freq#,
  # "Pelo menos um"=medicamentos$CatTable$Overall$Profilaxia$freq
)
t.med <- as.table(t.med[2,])

t.comorb <- cbind(
  AR = comorbidades$CatTable$Overall$Artrite.Reumatoide$freq,
  AVE = comorbidades$CatTable$Overall$AVE$freq,
  Cardiopatia = comorbidades$CatTable$Overall$Cardiopatia$freq,
  DM = comorbidades$CatTable$Overall$DM$freq,
  DR = comorbidades$CatTable$Overall$Doenca.Reumatica$freq,
  HAS = comorbidades$CatTable$Overall$HAS$freq,
  Obesidade=comorbidades$CatTable$Overall$Obesidade$freq
)
t.comorb <- as.table(t.comorb[2,])

png("graficos/medicamentos.png", 700, 700)
mybarplot(t.med, "")
dev.off()

png("graficos/comorbidades.png", 700, 700)
mybarplot(t.comorb, "")
dev.off()

# locale padrão -----------------------------------------------------------
Sys.setlocale("LC_NUMERIC", "C")
