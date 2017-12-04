source("scripts/mybarplot.R", encoding = "UTF-8")

# comorbidades ------------------------------------------------------------

png("graficos/comorbidades-genero.png", 700, 1400)
par(mfrow = c(4,2))
mybarplot(ar.genero, "AR", "Gênero", ylim = c(0,250))
mybarplot(ave.genero, "AVE", "Gênero", ylim = c(0,250))
mybarplot(cardio.genero, "Cardiopatia", "Gênero", ylim = c(0,250))
mybarplot(dm.genero, "DM", "Gênero", ylim = c(0,250))
mybarplot(dr.genero, "DR", "Gênero", ylim = c(0,250))
mybarplot(has.genero, "HAS", "Gênero", ylim = c(0,250))
mybarplot(obesidade.genero, "Obesidade", "Gênero", ylim = c(0,250))
mybarplot(numcomorb.genero, "Número de comorbidades", "Gênero", ylim = c(0,250))
dev.off()

png("graficos/comorbidades-idade.png", 700, 1400)
par(mfrow = c(4,2))
mybarplot(ar.idade, "AR", "Faixa etária", ylim = c(0,250))
mybarplot(ave.idade, "AVE", "Faixa etária", ylim = c(0,250))
mybarplot(cardio.idade, "Cardiopatia", "Faixa etária", ylim = c(0,250))
mybarplot(dm.idade, "DM", "Faixa etária", ylim = c(0,250))
mybarplot(dr.idade, "DR", "Faixa etária", ylim = c(0,250))
mybarplot(has.idade, "HAS", "Faixa etária", ylim = c(0,250))
mybarplot(obesidade.idade, "Obesidade", "Faixa etária", ylim = c(0,250))
mybarplot(numcomorb.idade, "Número de comorbidades", "Faixa etária", ylim = c(0,250))
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
cp <- barplot(CAE.tab, axes = FALSE, axisnames = FALSE, ylab = "Quantidade", col = rainbow(length((rownames(CAE.alfa))), .6, .6), ylim = c(0 , 1.3*max(CAE.tab)))
text(cp, par("usr")[3]-5, labels = rownames(CAE.tab), srt = 60, adj = c(1,1), xpd = TRUE)
axis(2)
title("Casos por Centro de Atenção Especializada")
dev.off()

png("graficos/centros_o_alfabetica.png", 700, 700)
par(mar = c(7, 4, 4, 2) + 0.2) #add room for the rotated labels
cp <- barplot(CAE.alfa, axes = FALSE, axisnames = FALSE, ylab = "Quantidade", col = rev(rainbow(length((rownames(CAE.alfa))), .6, .6)), ylim = c(0 , 1.3*max(CAE.alfa)))
text(cp, par("usr")[3]-5, labels = rownames(CAE.alfa), srt = 60, adj = c(1,1), xpd = TRUE)
axis(2)
title("Casos por Centro de Atenção Especializada")
dev.off()

png("graficos/trombos.png", 700, 700)
par(mfrow = c(2,2))
with(dados, mybarplot(table(Trombo.Agudo), "Trombo agudo", ylim = c(0,300)))
with(dados, mybarplot(table(Trombo.Subagudo), "Trombo subagudo", ylim = c(0,300)))
with(dados, mybarplot(table(Trombo.Antigo), "Trombo antigo", ylim = c(0,300)))
with(dados, mybarplot(table(Trombo.Recanalizado), "Trombo recanalizado", ylim = c(0,300)))
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
