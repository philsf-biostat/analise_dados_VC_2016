t.med <- cbind(
  Dabigatrana=medicamentos$CatTable$Overall$Dabigatrana$freq,
  Enoxaparina=medicamentos$CatTable$Overall$Enoxaparina$freq,
  Rivoraxabana=medicamentos$CatTable$Overall$Rivoraxabana$freq,
  Warfarina=medicamentos$CatTable$Overall$Warfarina$freq#,
  # "Pelo menos um"=medicamentos$CatTable$Overall$Profilaxia$freq
  )

t.comorb <- cbind(
  Artrite.Reumatoide = comorbidades$CatTable$Overall$Enoxaparina$freq,
  AVC = comorbidades$CatTable$Overall$AVC$freq,
  Cardiopatia = comorbidades$CatTable$Overall$Cardiopatia$freq,
  DM = comorbidades$CatTable$Overall$DM$freq,
  Doenca.Reumatica = comorbidades$CatTable$Overall$Doenca.Reumatica$freq,
  HAS = comorbidades$CatTable$Overall$HAS$freq,
  OUTRAS = comorbidades$CatTable$Overall$OUTRAS$freq
)

Centro <- sort(table(dados$Grupo), decreasing = T)
# Centro <- table(dados$Grupo)

png("graficos/medicamentos.png", 700, 700)
barplot(t.med, beside = T, legend.text = c("NÃO", "SIM"), ylab = "Quantidade", xlab = "Medicamento")
title("Profilaxia medicamentosa")
dev.off()

png("graficos/comorbidades.png", 700, 700)
barplot(t.comorb, beside = T, legend.text = T, ylab = "Quantidade", xlab = "Comorbidade")
title("Presença de comorbidade")
dev.off()

png("graficos/centros.png", 700, 700)
par(mar = c(7, 4, 4, 2) + 0.2) #add room for the rotated labels
cp <- barplot(Centro, axes = FALSE, axisnames = FALSE, ylab = "Quantidade")
text(cp, par("usr")[3], labels = rownames(Centro), srt = 60, adj = c(1.1,1.1), xpd = TRUE, cex = .6)
axis(2)
title("Casos por Centro de Atenção Especializada")
dev.off()
