t.med <- cbind(
  Dabigatrana=medicamentos$CatTable$Overall$Dabigatrana$freq,
  Enoxaparina=medicamentos$CatTable$Overall$Enoxaparina$freq,
  Rivoraxabana=medicamentos$CatTable$Overall$Rivoraxabana$freq,
  Warfarina=medicamentos$CatTable$Overall$Warfarina$freq
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

png("graficos/medicamentos.png", 700, 700)
barplot(t.med, beside = T, legend.text = T, ylab = "Quantidade", xlab = "Medicamento")
title("Profilaxia medicamentosa")
dev.off()

png("graficos/comorbidades.png", 700, 700)
barplot(t.comorb, beside = T, legend.text = T, ylab = "Quantidade", xlab = "Comorbidade")
title("Presença de comorbidade")
dev.off()

png("graficos/centro.png", 700, 700)
barplot(table(dados$Grupo), beside = T, ylab = "Quantidade", xlab = "Centro")
title("Casos por Centro de Atenção Especializada")
dev.off()
