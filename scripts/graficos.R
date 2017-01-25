# t.med <- cbind(
#   Dabigatrana=medicamentos$CatTable$Overall$Dabigatrana$freq,
#   Enoxaparina=medicamentos$CatTable$Overall$Enoxaparina$freq,
#   Rivaroxabana=medicamentos$CatTable$Overall$Rivaroxabana$freq,
#   Warfarina=medicamentos$CatTable$Overall$Warfarina$freq#,
#   # "Pelo menos um"=medicamentos$CatTable$Overall$Profilaxia$freq
#   )
# 
# t.comorb <- cbind(
#   Artrite.Reumatoide = comorbidades$CatTable$Overall$Enoxaparina$freq,
#   AVC = comorbidades$CatTable$Overall$AVC$freq,
#   Cardiopatia = comorbidades$CatTable$Overall$Cardiopatia$freq,
#   DM = comorbidades$CatTable$Overall$DM$freq,
#   Doenca.Reumatica = comorbidades$CatTable$Overall$Doenca.Reumatica$freq,
#   HAS = comorbidades$CatTable$Overall$HAS$freq,
#   Obesidade = comorbidades$CatTable$Overall$Obesidade$freq
# )

Centro <- sort(table(dados$Grupo), decreasing = T)
Centro.alfa <- table(dados$Grupo)

idade.tab <- table(dados$Idade.cat)
obesidade.tab <- table(dados$Obesidade)

mybarplot <- function(tab, desfecho = NULL, preditor = NULL) {
  par(mar = c(7, 5, 4, 2) + 0.1) #add room for the rotated labels
  main <- paste(desfecho, "por", preditor)
  col <- rev(rainbow(length((rownames(tab))), .6, .6))
  barplot(tab,
          beside = T,
          col = col,
          cex.axis = 1.2,
          cex.lab = 1.6,
          cex.names = 1.5,
          cex.sub = 1.2,
          ylim = c(0, 1.2*max(tab)),
          xlab = desfecho,
          ylab = "Número de pacientes")
  if ( is.matrix(tab) ) {
  mtext( paste("p-valor:",
              format.pval(fisher.test(tab, workspace = 2e+6)$p.value,
                          eps = .001,
                          digits = 2)
              ), cex = 1.3)
    legend("topright",
           rownames(tab),
           title = preditor,
           fill = col
    )
  }
  else
    main <- desfecho
  title(
    main = main,
    cex.main = 2,
  )
}

png("graficos/medicamentos.png", 700, 700)
barplot(t.med, beside = T, legend.text = c("NÃO", "SIM"), ylab = "Quantidade", xlab = "Medicamento", col = rainbow(2, .6, .6), ylim = c(0 , 1.25*max(t.med)))
title("Profilaxia medicamentosa")
dev.off()

png("graficos/comorbidades.png", 700, 700)
barplot(t.comorb, beside = T, legend.text = T, ylab = "Quantidade", xlab = "Comorbidade", col = rainbow(2, .6, .6), ylim = c(0 , 1.25*max(t.comorb)))
title("Presença de comorbidade")
dev.off()

png("graficos/comorbidades-genero.png", 800, 800)
par(mfrow = c(3,3))
mybarplot(ar.genero, "AR", "Gênero")
mybarplot(avc.genero, "AVC", "Gênero")
mybarplot(cardio.genero, "Cardiopatia", "Gênero")
mybarplot(dm.genero, "DM", "Gênero")
mybarplot(dr.genero, "DR", "Gênero")
mybarplot(has.genero, "HAS", "Gênero")
mybarplot(obesidade.genero, "Obesidade", "Gênero")
dev.off()

png("graficos/comorbidades-idade.png", 800, 800)
par(mfrow = c(3,3))
mybarplot(ar.idade, "AR", "Idade")
mybarplot(avc.idade, "AVC", "Idade")
mybarplot(cardio.idade, "Cardiopatia", "Idade")
mybarplot(dm.idade, "DM", "Idade")
mybarplot(dr.idade, "DR", "Idade")
mybarplot(has.idade, "HAS", "Idade")
mybarplot(obesidade.idade, "Obesidade", "Idade")
dev.off()

png("graficos/profilaxia-genero.png", 700, 700)
mybarplot(profilaxia.genero, "Profilaxia", "Gênero")
dev.off()

png("graficos/profilaxia-idade.png", 700, 700)
mybarplot(profilaxia.idade, "Profilaxia", "Idade")
dev.off()

png("graficos/centros.png", 700, 700)
par(mar = c(7, 4, 4, 2) + 0.2) #add room for the rotated labels
cp <- barplot(Centro, axes = FALSE, axisnames = FALSE, ylab = "Quantidade", col = rainbow(13, .6, .6), ylim = c(0 , 1.3*max(Centro)))
text(cp, par("usr")[3], labels = rownames(Centro), srt = 60, adj = c(1.1,1.1), xpd = TRUE, cex = .6)
axis(2)
title("Casos por Centro de Atenção Especializada")
dev.off()

png("graficos/centros_o_alfabetica.png", 700, 700)
par(mar = c(7, 4, 4, 2) + 0.2) #add room for the rotated labels
cp <- barplot(Centro.alfa, axes = FALSE, axisnames = FALSE, ylab = "Quantidade", col = rainbow(13, .6, .6), ylim = c(0 , 1.3*max(Centro)))
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

png("graficos/idoso.png", 700, 700)
barplot(idade.tab, col = rainbow(2, .6, .6), ylab = "Quantidade", ylim = c(0 , 1.2*max(idade.tab)))
title("Idade")
dev.off()

png("graficos/obesidade.png", 700, 700)
barplot(obesidade.tab, col = rainbow(2, .6, .6), ylab = "Quantidade", ylim = c(0 , 1.2*max(obesidade.tab)))
title("Obesidade")
dev.off()
