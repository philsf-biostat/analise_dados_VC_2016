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
  HAS = comorbidades$CatTable$Overall$HAS$freq
)

Centro <- sort(table(dados$Grupo), decreasing = T)
Centro.alfa <- table(dados$Grupo)

png("graficos/medicamentos.png", 700, 700)
barplot(t.med, beside = T, legend.text = c("NÃO", "SIM"), ylab = "Quantidade", xlab = "Medicamento", col = rainbow(2, .6, .6))
title("Profilaxia medicamentosa")
dev.off()

png("graficos/comorbidades.png", 700, 700)
barplot(t.comorb, beside = T, legend.text = T, ylab = "Quantidade", xlab = "Comorbidade", col = rainbow(2, .6, .6))
title("Presença de comorbidade")
dev.off()

png("graficos/centros.png", 700, 700)
par(mar = c(7, 4, 4, 2) + 0.2) #add room for the rotated labels
cp <- barplot(Centro, axes = FALSE, axisnames = FALSE, ylab = "Quantidade", col = rainbow(13, .6, .6))
text(cp, par("usr")[3], labels = rownames(Centro), srt = 60, adj = c(1.1,1.1), xpd = TRUE, cex = .6)
axis(2)
title("Casos por Centro de Atenção Especializada")
dev.off()

png("graficos/centros_o_alfabetica.png", 700, 700)
par(mar = c(7, 4, 4, 2) + 0.2) #add room for the rotated labels
cp <- barplot(Centro.alfa, axes = FALSE, axisnames = FALSE, ylab = "Quantidade", col = rainbow(13, .6, .6))
text(cp, par("usr")[3], labels = rownames(Centro.alfa), srt = 60, adj = c(1.1,1.1), xpd = TRUE, cex = .6)
axis(2)
title("Casos por Centro de Atenção Especializada")
dev.off()
png("graficos/idade.png", 700, 700)
with(dados, hist(Idade, ylab = "Frequência", xlab = "Idade (anos)", ylim = c(0, 120), main = "Histograma de Idade", col = "lightblue"))
abline(v = 65, lwd = 2, col = "red")
legend("topleft", "Idade = 65 anos", lwd = 2, col = "red", title = "Ponto de corte")
dev.off()

png("graficos/imc.png", 700, 700)
with(dados, hist(IMC, ylab = "Frequência", ylim = c(0,140), main = "Histograma de IMC", col = "lightblue"))
abline(v = 30, lwd = 2, col = "red")
legend("topright", "IMC = 30", lwd = 2, col = "red", title = "Ponto de corte")
dev.off()
